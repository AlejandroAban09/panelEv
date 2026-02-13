# Documentación Visual del Proyecto


## 1. Diagrama Entidad-Relación (ER)
*Describe la estructura de la base de datos y cómo se conectan las tablas.*

```mermaid
erDiagram
    %% Entidades Principales
    TICKETS {
        int id PK
        int tienda_id FK
        int encargado_id FK
        int tipo_id FK
        string status
        datetime created_at
        datetime closed_at
        int closed_by FK "Usuario que cerró"
    }

    TIENDAS {
        int id PK
        string nombre
        string centro_costo
        int gerente FK
        int supervisor FK
        datetime deleted_at "Soft Delete"
    }

    ENCARGADOS {
        int id PK
        string nombre
        int tienda_id FK
        datetime deleted_at "Soft Delete"
    }

    USUARIOS {
        int id PK
        string usuario
        string nombre
        int rol "1=Admin, 2=Operador"
        string tipo_id "IDs de incidencias permitidas"
        datetime deleted_at "Soft Delete"
    }

    %% Catálogos de Personal Externo/Alertas
    GERENTES {
        int id PK
        string nombre
        string telefono
        datetime deleted_at "Soft Delete"
    }

    SUPERVISORES {
        int id PK
        string nombre
        string telefono
        datetime deleted_at "Soft Delete"
    }

    TIPOS_INCIDENCIA {
        int id PK
        string nombre "Ej: Robo, Merma"
        string color
    }

    %% Relaciones
    TIENDAS ||--|{ TICKETS : "Genera"
    ENCARGADOS ||--|{ TICKETS : "Reporta"
    TIPOS_INCIDENCIA ||--|{ TICKETS : "Clasifica"
    
    GERENTES ||--|{ TIENDAS : "Gestiona"
    SUPERVISORES ||--|{ TIENDAS : "Supervisa"
    
    TIENDAS ||--o{ ENCARGADOS : "Tiene asignado"
    
    USUARIOS ||--o{ TICKETS : "Gestiona/Cierra"
```

## 2. Diagrama de Flujo (Ciclo de Vida de Incidencia)
*Explica el proceso operativo desde que se detecta una incidencia hasta que se cierra.*

```mermaid
flowchart TD
    %% Inicio
    A(["Inicio: Incidencia Detectada"]) --> B{"¿Usuario Validado?"}

    %% Validación de Usuario/Acceso
    B -- No --> C["Bloquear Acceso / Error"]
    B -- Sí --> D["Seleccionar Tienda y Tipo"]

    %% Generación de Ticket
    subgraph Creacion ["Creación"]
    D --> E{"¿Datos Correctos?"}
    E -- No --> D
    E -- Sí --> F["Crear Ticket (Estado: ABIERTO)"]
    F --> G["Guardar en BD"]
    end

    %% Notificaciones
    subgraph Notificaciones
    G --> H{"¿Requiere Alerta Inmediata?"}
    H -- Sí --> I["Enviar Whatsapp a Gerente/Supervisor"]
    H -- No --> J["Mostrar en Dashboard"]
    I --> J
    end

    %% Gestión
    subgraph GestionOperativa ["Gestión Operativa"]
    J --> K["Operador (Rol 2) Revisa Ticket"]
    K --> L{"¿Solucionado / Validado?"}
    
    L -- "No (Pendiente)" --> M["Agregar Comentario / Seguimiento"]
    M --> K
    
    L -- "Sí (Cerrar)" --> N["Cambiar Estado a CERRADO"]
    end

    %% Cierre
    N --> O["Actualizar 'closed_at' y 'closed_by'"]
    O --> P(["Fin del Proceso"])
```

## 3. Diagrama de Casos de Uso (Funcional)
*Define los roles y sus permisos. Ideal para explicar el sistema a clientes o usuarios finales.*

```mermaid
flowchart TD
    %% Actores
    Admin["Administrador"]
    Operador["Operador (Mesa de Ayuda)"]
    Encargado["Encargado de Tienda"]
    Sistema["Sistema (Automático)"]

    %% Funciones de Administración
    UC1["Gestionar Usuarios y Roles"]
    UC2["Configurar Catálogos<br/>(Tiendas, Gerentes, Supervisores)"]
    UC3["Ver Reportes Globales"]

    %% Funciones Operativas
    UC4["Revisar Nuevas Incidencias"]
    UC5["Validar Evidencias (Fotos/Datos)"]
    UC6["Cerrar Ticket / Resolver"]
    
    %% Funciones desde Tienda
    UC7["Reportar Incidencia"]
    UC8["Adjuntar Evidencia"]

    %% Funciones Automáticas
    UC9["Notificar a Supervisor/Gerente<br/>(WhatsApp/Email)"]

    %% Relaciones
    Admin --> UC1
    Admin --> UC2
    Admin --> UC3
    Admin -->|Puede ver| UC4
    
    Operador --> UC4
    Operador --> UC5
    Operador --> UC6
    
    Encargado --> UC7
    Encargado --> UC8

    %% El sistema reacciona
    UC7 -.->|Dispara Notificación| UC9
    Sistema --> UC9
```
