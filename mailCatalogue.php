<?php
//phpmailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';



if(isset($_POST['emailFrom']))
{ 
$values = $_POST['values'];
var_dump ($values);
$from = $_POST['emailFrom'];
$message = '<html><body>';
$message .= '<span>Merci de t&eacute;l&eacute;charger notre catalogue: </span><br>';
$message .= '<a href="https://atelier-lemee.com/alm-catalogue-2023.pdf">Cliquer ici</a><br>';
$message .= 'Sinon, vous pouvez copier coller le lien suivant : https://atelier-lemee.com/alm-catalogue-2023.pdf';
$message .= '</body></html>';

$servername = 'localhost';
$username = 'eurod-lm_2020';
$password = 'Skm500l$';
$dbname = 'eurod-lm_2020';

$conn = new mysqli($servername, $username, $password, $dbname);



if ($conn->connect_error) {
    echo"Connection failed: " . $conn->connect_error;
}

else {
    $sql = "INSERT INTO `s14_email_pdf` (`id`, `email`, `valuer-checkbox`,  `time`) VALUES (NULL, '".$_POST['emailFrom']."', '".$values."', CURRENT_TIMESTAMP)";
    if ($conn->query($sql) === TRUE) {
        echo "Nouvel enregistrement créé avec succès.";
    } else {
        echo "Erreur : " . $sql . "<br>" . $conn->error;
    }

$conn->close();

}
}

$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'noreplysmtps@gmail.com';                     //SMTP username
    $mail->Password   = 'xpbmampjzhanzkmu';                               //SMTP password
    $mail->SMTPSecure = 'ssl';         //Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
    $mail->Port       = '465';                                    //TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

    //Recipients
    $mail->setFrom('noreplysmtps@gmail.com', 'Admin');
    $mail->addAddress($from,'Destinataire');          //Add a recipient
    /*
    //send mail admin
    $mail->setFrom('noreplysmtps@gmail.com', 'Admin');
    $mail->addAddress('contact@eurodrapeau.com','Destinataire');          //Add a recipient
    */
    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'TELECHARGER NOTRE CATALOGUE PDF';
    $mail->Body    = $message;

    $mail->send();
     header('Location: https://www.eurodrapeau.com/content/157-remerciement-demande-catalogue');
} catch (Exception $e) {
    echo 'Une erreur est survenue : ', $mail->ErrorInfo;
}
try {
    $values = $_POST['values'];
    if ($values = 1) {
        $reponse = "recontacter";
       $values = filter_var($reponse, FILTER_SANITIZE_NUMBER_INT);
    } else {
        $reponse="sans recontacter";
        $values = filter_var($reponse, FILTER_SANITIZE_NUMBER_INT);
    }

    // Définissez les informations sur la requête de l'utilisateur
    $infos_requete = [
        "ip_utilisateur" => $_SERVER["REMOTE_ADDR"],
        "addres_mail_utilisateur" => $from,
        "message_utilisateur" => $values,
    ];

    function envoyer_mail_admin($infos_requete) {

        // Obtenez les informations sur la requête de l'utilisateur
        $ip_utilisateur = $infos_requete["ip_utilisateur"];
        $address_mail_utilisateur = $infos_requete["addres_mail_utilisateur"];
        $message_utilisateur = $infos_requete["message_utilisateur"];

        // Envoyez un e-mail à l'administrateur
        $destinataire = "sahazarandry54@gmail.com";
        $objet = "Requête d'un demande telechargement catalogue par ";
        $corps = "Un utilisateur a fait une requête sur la telechargement de catalogue.

        * notification : $message_utilisateur
        * l'utilisateur : $address_mail_utilisateur

        Cordialement,
        Site Web";

        // Validez les données saisies par l'utilisateur
        $ip_utilisateur = filter_var($ip_utilisateur, FILTER_SANITIZE_STRING);
        $address_mail_utilisateur = filter_var($address_mail_utilisateur, FILTER_SANITIZE_EMAIL);
        $message_utilisateur = filter_var($message_utilisateur, FILTER_SANITIZE_EMAIL);
        // Définissez la valeur de la variable $values
        

        mail($destinataire, $objet, $corps);
    }

    // Envoyez un e-mail à l'administrateur
    envoyer_mail_admin($infos_requete);

} catch (Exception $e) {
    echo "Une erreur est survenue : ", $mail->ErrorInfo;
}
?>
