<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Mailer {

    public function enviarIncidencia(array $destinatarios, string $asunto, string $html, ?string $adjunto = null): bool
    {
        try {
            $mail = new PHPMailer(true);

            // SMTP (pon tus datos reales)
            $mail->isSMTP();
            $mail->Host       = 'mxa.web-hostingmx.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'incidencias@dunosusa.mx';
            $mail->Password   = '1#07B8@Nbu14';
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port       = 587;
            $mail->CharSet = 'UTF-8';
            $mail->Encoding = 'quoted-printable'; 
            $mail->isHTML(true);
            $mail->setFrom('incidencias@dunosusa.mx', 'Sistema de Incidencias');
            foreach ($destinatarios as $email) {
                $email = trim($email);
                if ($email !== '') $mail->addAddress($email);
            }
            $mail->Subject = $asunto;
            $mail->Body    = $html;
            if (!empty($adjunto) && file_exists($adjunto)) {
                $mail->addAttachment($adjunto);
            }

            $mail->send();
            return true;

        } catch (Exception $e) {
            log_message('error', 'Mailer error: '.$e->getMessage());
            return false;
        }
    }
}
