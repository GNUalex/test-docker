<?php
// src/Controller/ExamenController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

class ExamenController
{
    public function saludos(): Response
    {
        $nombre = getenv('NOMBRE');
        $texto = getenv('TEXTO');

        return new Response(
            '<html><body>Hola '.$nombre.'!!! Este es el texto recibido: '.$texto.'</body></html>'
        );
    }
}
