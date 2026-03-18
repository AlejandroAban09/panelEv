# Analisis de la Base de Datos del Proyecto

Documento generado a partir de la revision directa de los archivos SQL (`hgrrctpa_wppinc.sql`, `nuevos_modulos.sql`) y la configuracion de CodeIgniter 3 (`database.php`).

---

## 1. Motor de Almacenamiento: InnoDB

**Confirmado: Todas las tablas del sistema utilizan InnoDB como motor de almacenamiento.**

Esto es fundamental porque InnoDB soporta:
- **Llaves foraneas (Foreign Keys):** Permiten mantener la integridad referencial entre tablas.
- **Transacciones:** Permiten agrupar operaciones SQL en bloques atomicos (`trans_start()` / `trans_complete()`), garantizando que todas se ejecuten o ninguna.

### Evidencia por tabla

| Tabla              | Motor     | Archivo fuente              |
|--------------------|-----------|-----------------------------|
| `tickets`          | `InnoDB`  | `hgrrctpa_wppinc.sql:131`   |
| `encargados`       | `InnoDB`  | `hgrrctpa_wppinc.sql:42`    |
| `evidencias`       | `InnoDB`  | `hgrrctpa_wppinc.sql:70`    |
| `tiendas`          | `InnoDB`  | `hgrrctpa_wppinc.sql:181`   |
| `tipos_incidencia` | `InnoDB`  | `hgrrctpa_wppinc.sql:755`   |
| `usuarios`         | `InnoDB`  | `hgrrctpa_wppinc.sql:787`   |
| `gerentes`         | `InnoDB`  | `nuevos_modulos.sql:11`     |
| `supervisores`     | `InnoDB`  | `nuevos_modulos.sql:23`     |

---

## 2. Cotejamiento (Collation)

### Configuracion en CodeIgniter 3

El archivo `app/backend-dnsinc/config/database.php` establece la conexion con:

```php
'char_set' => 'utf8',
'dbcollat' => 'utf8_general_ci',
```

### Cotejamiento real por tabla

Existe una **inconsistencia** entre las tablas originales (importadas del servidor de produccion) y las tablas nuevas creadas durante el desarrollo:

| Tabla              | Charset   | Collation              | Observacion                                  |
|--------------------|-----------|------------------------|----------------------------------------------|
| `tickets`          | `latin1`  | `latin1_swedish_ci`    | Charset heredado del servidor original       |
| `encargados`       | `latin1`  | `latin1_swedish_ci`    | Charset heredado del servidor original       |
| `evidencias`       | `latin1`  | `latin1_swedish_ci`    | Charset heredado del servidor original       |
| `tipos_incidencia` | `latin1`  | `latin1_swedish_ci`    | Charset heredado del servidor original       |
| `usuarios`         | `latin1`  | `latin1_swedish_ci`    | Charset heredado del servidor original       |
| `tiendas`          | `utf8`    | `utf8_unicode_ci`      | Mixto: algunos campos usan `utf8_spanish_ci` |
| `gerentes`         | `utf8mb4` | (default de `utf8mb4`) | Creada correctamente con charset moderno     |
| `supervisores`     | `utf8mb4` | (default de `utf8mb4`) | Creada correctamente con charset moderno     |

### Explicacion

- **`latin1_swedish_ci`:** Es el cotejamiento por defecto de MariaDB en muchos servidores compartidos. No soporta de forma nativa caracteres como acentos (a, e, i, o, u) ni la ene (n), aunque en la practica los muestra correctamente porque la conexion PHP negocia `utf8`.
- **`utf8_spanish_ci`:** Usado en campos especificos de `tiendas` (nombre, estado, municipio) para ordenar correctamente segun las reglas del idioma espanol.
- **`utf8mb4`:** El charset mas completo. Soporta todos los caracteres Unicode, incluyendo emojis. Es el estandar recomendado.

### Recomendacion

Para un entorno de produccion formal, se recomienda migrar todas las tablas a `utf8mb4` para lograr consistencia total. Sin embargo, el sistema funciona correctamente en su estado actual porque la capa de conexion de CodeIgniter gestiona la codificacion de forma transparente.

---

## 3. Tabla de Tickets — Campos Clave

### Estructura completa

```sql
CREATE TABLE `tickets` (
  `id`            int(11) NOT NULL,
  `encargado_id`  int(11) NOT NULL,
  `tienda_id`     int(11) NOT NULL,
  `tipo_id`       int(11) DEFAULT NULL,
  `descripcion`   text DEFAULT NULL,
  `ruta_zip`      varchar(255) DEFAULT NULL,
  `status`        varchar(20) DEFAULT 'pendiente',
  `created_at`    datetime DEFAULT current_timestamp(),
  `closed_at`     datetime DEFAULT NULL,
  `closed_by`     int(11) DEFAULT NULL,
  `enviado_at`    datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
```

### Descripcion de campos clave (ademas de los IDs)

| Campo         | Tipo           | Descripcion                                                                                        |
|---------------|----------------|----------------------------------------------------------------------------------------------------|
| `status`      | `varchar(20)`  | Controla el ciclo de vida del ticket. Valores posibles: `pendiente`, `abierto`, `cerrado`.         |
| `ruta_zip`    | `varchar(255)` | Ruta al archivo ZIP que contiene todas las evidencias empaquetadas (imagenes, videos, documentos). |
| `closed_at`   | `datetime`     | Fecha y hora exacta en que se cerro el ticket. NULL si sigue abierto.                             |
| `closed_by`   | `int(11)`      | ID del usuario que cerro el ticket. Crea una pista de auditoria.                                  |
| `enviado_at`  | `datetime`     | Marca el momento en que el ticket fue completado y enviado desde el chatbot de WhatsApp.          |
| `descripcion` | `text`         | Descripcion libre del problema reportado.                                                         |

### Tabla de Evidencias (complementaria)

La tabla `evidencias` almacena los archivos multimedia asociados a cada ticket:

```sql
CREATE TABLE `evidencias` (
  `id`              int(11) NOT NULL,
  `ticket_id`       int(11) NOT NULL,          -- FK al ticket
  `tipo_archivo`    varchar(50) NOT NULL,      -- image, video, document, audio
  `url_storage`     varchar(300) NOT NULL,     -- Ruta fisica del archivo
  `nombre_archivo`  varchar(255) DEFAULT NULL, -- Nombre generado del archivo
  `tamano_bytes`    int(11) DEFAULT NULL,      -- Tamano en bytes
  `created_at`      datetime,
  `wa_media_id`     varchar(80) DEFAULT NULL   -- ID del media en la API de WhatsApp
) ENGINE=InnoDB;
```

### Nota sobre Soft Delete

La tabla `tickets` **no usa soft delete** (`deleted_at`). El ciclo de vida se maneja exclusivamente mediante el campo `status`.

El soft delete **si se implementa** en las tablas de catalogos mediante el campo `activo`:

| Tabla              | Campo de Soft Delete | Valores          |
|--------------------|----------------------|------------------|
| `encargados`       | `activo`             | 1 = Activo, 0 = Eliminado logicamente |
| `tiendas`          | `activo`             | 1 = Activo, 0 = Eliminado logicamente |
| `usuarios`         | `activo`             | 1 = Activo, 0 = Eliminado logicamente |
| `tipos_incidencia` | `activo`             | 1 = Activo, 0 = Eliminado logicamente |
| `gerentes`         | `activo`             | 1 = Activo, 0 = Eliminado logicamente |
| `supervisores`     | `activo`             | 1 = Activo, 0 = Eliminado logicamente |

---

## 4. Normalizacion — Relacion Tiendas con Supervisores/Encargados

### El problema original (desnormalizacion)

La tabla `tiendas` fue importada de un sistema previo donde los supervisores, gerentes y directores se almacenaban como **texto plano** (nombres como cadenas de texto), no como llaves foraneas a tablas independientes:

```sql
-- Estructura original de tiendas (desnormalizada)
`supervisor` varchar(150) DEFAULT NULL,   -- Ej: 'EMILIO MEDINA'
`gerente`    varchar(150) DEFAULT NULL,   -- Ej: 'JOSE SOLIS'
`director`   varchar(150) DEFAULT NULL,   -- Ej: 'GILMER CASTILLO'
```

### Problemas que esto generaba

1. **Redundancia de datos:** El nombre "EMILIO MEDINA" aparece repetido en decenas de filas de tiendas.
2. **Inconsistencia potencial:** Si el supervisor cambiaba de nombre o se reasignaba, habia que actualizar manualmente todas las filas afectadas.
3. **Falta de datos adicionales:** No habia forma de almacenar telefono, email u otros datos del supervisor/gerente asociados a la tienda.

### La solucion implementada

Se crearon las tablas normalizadas `gerentes` y `supervisores` (archivo `nuevos_modulos.sql`):

```sql
CREATE TABLE `gerentes` (
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `nombre`     varchar(100) NOT NULL,
  `telefono`   varchar(20) NOT NULL,
  `email`      varchar(150) DEFAULT NULL,
  `activo`     tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `supervisores` (
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `nombre`     varchar(100) NOT NULL,
  `telefono`   varchar(20) NOT NULL,
  `email`      varchar(150) DEFAULT NULL,
  `activo`     tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

### Mecanismo de Snapshot Dual (COALESCE)

En el modelo `Mtickets.php`, se implemento un sistema de **doble referencia** para resolver la relacion entre tickets y supervisores/gerentes. Esto permite conservar un registro historico:

```php
// Modelo Mtickets.php - Joins dobles para cada rol
->join("gerentes g_snap", "g_snap.id = tickets.gerente_id", "left")   // Snapshot: gerente al crear el ticket
->join("gerentes g_curr", "g_curr.id = tiendas.gerente", "left")      // Actual: gerente actual de la tienda

->join("supervisores s_snap", "s_snap.id = tickets.supervisor_id", "left") // Snapshot
->join("supervisores s_curr", "s_curr.id = tiendas.supervisor", "left")    // Actual

// COALESCE prioriza el snapshot sobre el actual
->select("COALESCE(g_snap.nombre, g_curr.nombre) AS gerente_nombre")
->select("COALESCE(s_snap.nombre, s_curr.nombre) AS supervisor_nombre")
```

### Como funciona el COALESCE

1. Si el ticket tiene un `gerente_id` guardado (snapshot), se muestra ese nombre.
2. Si no tiene snapshot (es NULL), se usa el gerente actualmente asignado a la tienda.
3. Esto garantiza que los reportes historicos reflejen quien era el responsable al momento de la incidencia, aunque la tienda cambie de personal despues.

### Diagrama de la relacion

```
tickets
  |--- encargado_id  ---> encargados.id   (quien reporta)
  |--- tienda_id     ---> tiendas.id      (donde ocurrio)
  |--- tipo_id       ---> tipos_incidencia.id (clasificacion)
  |--- closed_by     ---> usuarios.id     (quien cerro)
  |--- gerente_id    ---> gerentes.id     (snapshot historico)
  |--- supervisor_id ---> supervisores.id (snapshot historico)
  
tiendas
  |--- supervisor    ---> supervisores.id (asignacion actual)
  |--- gerente       ---> gerentes.id     (asignacion actual)
```

---

*Documento generado el 24 de Febrero de 2026.*
*Basado en la revision directa de los archivos SQL y modelos del proyecto panelEv.*
