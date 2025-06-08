<?php

namespace Com\Daw2\Core;

use Ahc\Jwt\JWT;
use Ahc\Jwt\JWTException;
use Com\Daw2\Controllers\ErrorController;
use Com\Daw2\Controllers\UsersController;
use Com\Daw2\Controllers\XogadoresController;
use Com\Daw2\Helpers\JwtTool;
use Steampixel\Route;
use function Sodium\add;

class FrontController
{
    private static ?array $jwtData = null;
    private static array $permisos = [];
    public static function main()
    {
        if (JwtTool::requestHasToken()){
            try {
                $bearer = JwtTool::getBearerToken();
                $jwt = new Jwt($_ENV['secreto']);
                self::$jwtData = $jwt->decode($bearer);
                self::$permisos = UsersController::getPermisos(self::$jwtData['user_type']);
            }catch (JwtException $e){
                $controller = new ErrorController(403,['Message' => $e->getMessage()]);
                $controller->showError();
                die();
            }
        }else{
            self::$permisos = UsersController::getPermisos('');
        }
        Route::add(
            '/login',
            fn() =>(new UsersController())->login(),
            'post'
        );

        Route::add(
            '/xogadores',
            function (){
                if (str_contains(self::$permisos['xogadores'],'r')){
                (new XogadoresController())->listado();
                }else{
                    http_response_code(403);
                }
            },
            'get'
        );

         Route::add(
             '/xogadores/([0-9]{5})',
             function($numeroLicencia) {
                 if (str_contains(self::$permisos['xogadores'],'r')) {
                     (new XogadoresController())->getByNumeroLicencia((int)$numeroLicencia);
                 }else{
                     http_response_code(403);
                 }
             },
             'get'
         );

        Route::add(
            '/xogadores/([0-9]{5})',
            function ($numeroLicencia){
                if (str_contains(self::$permisos['xogadores'],'d')) {
                    (new XogadoresController())->deleteXogador((int)$numeroLicencia);
                }else{
                    http_response_code(403);
                }
            },
            'delete'
        );

        Route::add(
            '/xogadores/([0-9]{5})',
            function ($numeroLicencia){
                if (str_contains(self::$permisos['xogadores'],'w')) {
                    (new XogadoresController())->updateXogador((int)$numeroLicencia);
                }else{
                    http_response_code(403);
                }
            },
            'patch'
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
