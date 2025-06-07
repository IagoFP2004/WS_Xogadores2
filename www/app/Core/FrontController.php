<?php

namespace Com\Daw2\Core;

use Com\Daw2\Controllers\ErrorController;
use Com\Daw2\Controllers\XogadoresController;
use Steampixel\Route;
use function Sodium\add;

class FrontController
{
    public static function main()
    {
        Route::add(
            '/xogadores',
            fn() =>(new XogadoresController())->listado(),
            'get'
        );

         Route::add(
             '/xogadores/([0-9]{5})',
             fn($numeroLicencia) =>(new XogadoresController())->getByNumeroLicencia((int)$numeroLicencia),
             'get'
         );

        Route::add(
            '/xogadores/([0-9]{5})',
            fn($numeroLicencia) =>(new XogadoresController())->deleteXogador((int)$numeroLicencia),
            'get'
        );

        Route::pathNotFound(
            function () {
                (new ErrorController(404))->showError();
            }
        );

        Route::methodNotAllowed(
            function () {

            }
        );
        
        Route::run();
    }
}
