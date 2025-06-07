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
}