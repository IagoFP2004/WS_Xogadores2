<?php
declare(strict_types=1);
namespace Com\Daw2\Controllers;

use Ahc\Jwt\JWT;
use Com\Daw2\Core\BaseController;
use Com\Daw2\Libraries\Respuesta;
use Com\Daw2\Models\UsersModel;

class UsersController extends BaseController
{
    PUBLIC CONST ROL_ENTRENADOR = 'entrenador';
    PUBLIC CONST ROL_GERENTE = 'gestor';
    public function login():void
    {
        $modelo = new UsersModel();

        if (empty($_POST['email']) || empty($_POST['pass'])) {
            $respuesta = new Respuesta(400,['Error'=> 'Se necesitan usuario y contraseña para hacer login']);
        }else{
            $login = $modelo->getByEmail($_POST['email']);

            if ($login !== false) {
                if (password_verify($_POST['pass'],$login['password'])){
                    $payload = [
                        "email" => $login['email'],
                        "user_type"=>$login['user_type'],
                        "name"=>$login['name']
                    ];
                    $jwt = new JWT($_ENV['secreto'],'HS256',1800);
                    $token = $jwt->encode($payload);
                    $respuesta = new Respuesta(200, ['Token'=> $token]);
                }else{
                    $respuesta = new Respuesta(404,['Error'=> 'La contraseña es incorrecta']);
                }
            }else{
                $respuesta = new Respuesta(404,['Error'=> 'El email no corresponde a ningun usuario']);
            }

        }

        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public static function getPermisos(string $type):array
    {
        $permisos = [
            'xogadores'=>''
        ];

        return match ($type){
            self::ROL_ENTRENADOR => array_replace($permisos,['xogadores'=>'r']),
            self::ROL_GERENTE => array_replace($permisos,['xogadores'=>'rwd']),
            default => $permisos
        };
    }
}