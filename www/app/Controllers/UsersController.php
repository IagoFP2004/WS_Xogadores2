<?php
declare(strict_types=1);
namespace Com\Daw2\Controllers;

use Ahc\Jwt\JWT;
use Com\Daw2\Core\BaseController;
use Com\Daw2\Libraries\Respuesta;
use Com\Daw2\Models\UsersModel;
use Com\Daw2\Traits\BaseRestController;

class UsersController extends BaseController
{
    PUBLIC CONST ROL_ENTRENADOR = 'entrenador';
    PUBLIC CONST ROL_GERENTE = 'gestor';
    use BaseRestController;
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

    public function changePassword(string $email):void
    {
        $modelo = new UsersModel();
        $put = $this->getParams();
        $errores = $this->chechNewPasswordErrors($put);
        if ($errores === []){
            $login = $modelo->getByEmail($email);
            if ($login !== false && password_verify($put['old_password'],$login['password'])){
                if ($modelo->updatePassword($email,$put['new_password'])){
                    $respuesta = new Respuesta(200,['Exito'=>'La contraseña ha sido actualizada']);
                }else{
                    $respuesta = new Respuesta(400,['Error'=>'No se pudo actualizar la password']);
                }
            }else{
                $respuesta = new Respuesta(400,['Mensaje'=>'La contraseña no es correcta']);
            }
        }else{
            $respuesta = new Respuesta(400, $errores);
        }

        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public function chechNewPasswordErrors(array $data):array
    {
        $errores = [];

        if (empty($data['old_password'])) {
            $errores['old_password'] = "Se necesita la contraseña anterior";
        }

        if (empty($data['new_password'])) {
            $errores['new_password']="La nueva contraseña no puede estar vacia";
        }else if (!preg_match("/^(?=.*[a-z])(?=.*\d).{8,}$/", $data['new_password'])) {
            $errores['new_password'] = "new_password debe tener una longitud >= 8 y contener al menos una letra y un número.";
        }

        return $errores;
    }
}