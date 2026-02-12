<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name="x-apple-disable-message-reformatting">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Correo - Evidencia</title>
</head>

<body style="margin:0; padding:0; background-color:#eef2f7; font-family:Arial,Helvetica,sans-serif; color:#0f172a;">
    <!-- Preheader (oculto) -->
    <!--<<div style="display:none; max-height:0; overflow:hidden; opacity:0; color:transparent;">
        Evidencia cerrada · Folio #<?php echo $incidencia->id; ?>
    </div>-->

    <div style="display:none; font-size:1px; line-height:1px; max-height:0; max-width:0; opacity:0; overflow:hidden; mso-hide:all; color:transparent;">
        Evidencia cerrada · Folio #<?php echo $incidencia->id; ?>
    </div>

    <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"
        style="background-color:#eef2f7;">
        <tr>
            <td align="center" style="padding:24px 12px;">

                <!-- Contenedor principal -->
                <table role="presentation" width="680" cellpadding="0" cellspacing="0" border="0"
                    style="width:100%; max-width:680px; border-collapse:separate;">

                    <!-- HEADER CARD -->
                    <tr>
                        <td style="background:#22346e; border-radius:18px; overflow:hidden;">
                            <!-- Barra roja -->
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="height:8px; background:#c4302a; line-height:8px; font-size:0;">&nbsp;
                                    </td>
                                </tr>
                            </table>

                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="padding:20px 22px; color:#ffffff;">

                                        <!-- Fila logo + fecha (tablas, no flex) -->
                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0"
                                            border="0">
                                            <tr>
                                                <td align="left" valign="middle" style="padding:0; margin:0;">
                                                    <img src="https://dunosusa.com.mx/incidencias/images/logo-hd.png"
                                                        alt="Abarrotes Dunosusa" width="170"
                                                        style="display:block; border:0; outline:none; text-decoration:none; height:auto; max-width:170px;">
                                                </td>
                                                <td align="right" valign="middle"
                                                    style="padding:0; margin:0; font-size:12px; opacity:.92; color:#ffffff;">
                                                    <?php echo date('d/m/Y H:i') ?>
                                                </td>
                                            </tr>
                                        </table>

                                        <table role="presentation" width="100%" cellpadding="0" cellspacing="0"
                                            border="0">
                                            <tr>
                                                <td style="padding-top:14px;">
                                                    <div
                                                        style="font-size:28px; font-weight:700; line-height:1.15; margin:0;">
                                                        Evidencia cerrada
                                                    </div>
                                                    <div
                                                        style="font-size:14px; line-height:1.6; margin-top:6px; opacity:.95;">
                                                        La evidencia <strong>Folio
                                                            #<?php echo $incidencia->id; ?></strong> fue marcada como
                                                        <strong>cerrada</strong>.
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                        <!-- Badges (tablas + inline-block, sin gap/flex) -->
                                        <table role="presentation" cellpadding="0" cellspacing="0" border="0"
                                            style="margin-top:14px;">
                                            <tr>
                                                <td style="padding:0;">
                                                    <span
                                                        style="display:inline-block; margin:0 10px 10px 0; padding:8px 12px; border-radius:999px; background:rgba(255,255,255,.18); font-size:12px; color:#ffffff;">
                                                        <img src="https://dunosusa.com.mx/incidencias/images/icons/label-orange.png"
                                                        width="16" height="16" alt=""
                                                        style="display:inline-block; vertical-align:-3px; border:0; margin-right:6px; line-height:0; outline:none; text-decoration:none;">
                                                        <?php echo $incidencia->tipo_nombre; ?>
                                                    </span>
                                                    <span
                                                        style="display:inline-block; margin:0 10px 10px 0; padding:8px 12px; border-radius:999px; background:rgba(255,255,255,.18); font-size:12px; color:#ffffff;">
                                                        <img src="https://dunosusa.com.mx/incidencias/images/icons/store-blue.png"
                                                        width="16" height="16" alt=""
                                                        style="display:inline-block; vertical-align:-3px; border:0; margin-right:6px; line-height:0; outline:none; text-decoration:none;">
                                                        <?php echo $incidencia->tienda_nombre; ?>
                                                    </span>
                                                    <span
                                                        style="display:inline-block; margin:0 10px 10px 0; padding:8px 12px; border-radius:999px; background:rgba(255,255,255,.18); font-size:12px; color:#ffffff;">
                                                        <img src="https://dunosusa.com.mx/incidencias/images/icons/work-brown.png"
                                                        width="16" height="16" alt=""
                                                        style="display:inline-block; vertical-align:-3px; border:0; margin-right:6px; line-height:0; outline:none; text-decoration:none;">
                                                        CC <?php echo $incidencia->tienda_cc; ?>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- Espaciador -->
                    <tr>
                        <td style="height:16px; line-height:16px; font-size:0;">&nbsp;</td>
                    </tr>

                    <!-- INFO CARD -->
                    <tr>
                        <td style="background:#ffffff; border:1px solid #e5e7eb; border-radius:18px; padding:22px;">
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <!-- Col 1 -->
                                    <td valign="top" style="padding:0; width:50%;">
                                        <div style="font-size:12px; color:#6b7280;">Encargado</div>
                                        <div style="margin-top:4px; font-size:15px; font-weight:700; color:#0f172a;">
                                            <?php echo $incidencia->encargado_nombre; ?>
                                        </div>

                                        <div style="margin-top:14px; font-size:12px; color:#6b7280;">WhatsApp</div>
                                        <div style="margin-top:4px; font-size:15px; color:#0f172a;">
                                            <?php echo $incidencia->encargado_tel; ?>
                                        </div>
                                    </td>

                                    <!-- Col 2 -->
                                    <td valign="top" style="padding:0; width:50%;">
                                        <div style="font-size:12px; color:#6b7280;">Estado</div>
                                        <div style="margin-top:6px;">
                                            <span
                                                style="display:inline-block; padding:8px 12px; border-radius:12px; background:#f0fdf4; color:#166534; font-size:12px; font-weight:700; border:1px solid rgba(22,101,52,.25);">
                                                <img src="https://dunosusa.com.mx/incidencias/images/icons/dot-green.png"
                                                width="16" height="16" alt=""
                                                style="display:inline-block; vertical-align:-3px; border:0; margin-right:6px; line-height:0; outline:none; text-decoration:none;">
                                                Cerrada
                                            </span>
                                        </div>

                                        <div style="margin-top:14px; font-size:12px; color:#6b7280;">Fecha de cierre
                                        </div>
                                        <div style="margin-top:4px; font-size:15px; color:#0f172a;">
                                            <?php echo date("d/m/Y H:i", strtotime($incidencia->closed_at)); ?>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- FOOTER -->
                    <tr>
                        <td align="center"
                            style="padding:14px 6px 0 6px; font-size:12px; color:#64748b; line-height:1.6;">
                            Este correo fue enviado automáticamente por el sistema de evidencias.<br>
                            © 2025 Abarrotes Dunosusa · dunosusa.com.mx
                        </td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>
</body>

</html>