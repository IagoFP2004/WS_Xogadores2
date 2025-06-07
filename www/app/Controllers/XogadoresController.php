<?php
declare(strict_types=1);
namespace Com\Daw2\Controllers;

use Com\Daw2\Core\BaseController;
use Com\Daw2\Libraries\Respuesta;
use Com\Daw2\Models\XogadoresModel;


class XogadoresController extends BaseController
{
    public function listado():void
    {
        $modelo  = new XogadoresModel();
        try{
            $listado = $modelo->getXogadores($_GET);
            $respuesta = new Respuesta(200,$listado);
        }catch (\InvalidArgumentException $e){
           $respuesta = new Respuesta(400, ['error' => $e->getMessage()]);
        }
        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public function getByNumeroLicencia(int $numeroLicencia):void
    {
        $modelo = new XogadoresModel();

        $xogador = $modelo->getByNumeroLicencia($numeroLicencia);

        if  ($xogador !== false){
            $respuesta = new Respuesta(200,$xogador);
        }else{
            $respuesta = new Respuesta(404,['Error'=> 'no existe el jugador']);
        }

        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public function deleteXogador(int $numeroLicencia):void
    {
        $modelo = new XogadoresModel();

        $borrado = $modelo->deleteByNumeroLicencia($numeroLicencia);


        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

}