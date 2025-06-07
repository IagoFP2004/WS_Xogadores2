<?php
declare(strict_types=1);
namespace Com\Daw2\Controllers;

use Com\Daw2\Core\BaseController;
use Com\Daw2\Libraries\Respuesta;
use Com\Daw2\Models\EquipoModel;
use Com\Daw2\Models\NacionalidadeModel;
use Com\Daw2\Models\XogadoresModel;
use Com\Daw2\Traits\BaseRestController;
use DateTime;


class XogadoresController extends BaseController
{
    public const CAMPOS_UPDATE = ['numero_licencia','codigo_equipo','numero','nome','posicion','nacionalidade','ficha','estatura','data_nacemento','temporada'];
    use BaseRestController;
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

        if($borrado !== false){
            $respuesta = new Respuesta(200, ['Mensaje'=>'Xogador eliminado']);
        }else{
            $respuesta = new Respuesta(404,['Error'=> 'no existe el jugador a eliminar']);
        }

        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public function updateXogador(int $numeroLicencia):void
    {
        $modelo = new XogadoresModel();
        if ($modelo->getByNumeroLicencia($numeroLicencia) === false){
            $respuesta = new Respuesta(404,['Error'=> 'no existe el jugador']);
        }else{
            $put = $this->getParams();
            $errores = $this->checkErrors($put, $numeroLicencia);

            if ($errores === []){
                $updateData = [];
                foreach (self::CAMPOS_UPDATE as $campo){
                    if (isset($put[$campo])){
                        $updateData[$campo] = $put[$campo];
                    }
                }

                if ($updateData !== []){
                    if ($modelo->updateXogador($updateData, $numeroLicencia) !== false){
                        $respuesta = new Respuesta(200, ['Mensaje'=>'Xogador actualizado']);
                    }else{
                        $respuesta = new Respuesta(400,['Error'=> 'No se pudo actualizar el jugador']);
                    }
                }else{
                    $respuesta = new Respuesta(400,['Error'=> 'No se pasaron campos para actualizar']);
                }
            }else{
                $respuesta = new Respuesta(400,$errores);
            }
        }
        $this->view->show('json.view.php', ['respuesta' => $respuesta]);
    }

    public function checkErrors(array $data, ?int $numeroLicencia = null):array
    {
        $errores = [];
        $editando = !is_null($numeroLicencia);
        $modelo = new XogadoresModel();
        $equipoModelo = new EquipoModel();
        $nacionalidadeModel = new NacionalidadeModel();

        if (!$editando || (!empty($data['numero_licencia']))){
            if (filter_var($data['numero_licencia'], FILTER_VALIDATE_INT) === false || $data['numero_licencia'] < 1) {
                $errores['numero_licencia'] = 'Numero de licencia debe ser un entero mayor que 0';
            }else if ($modelo->getByNumeroLicencia((int)$data['numero_licencia']) !== false){
                $errores['numero_licencia'] = 'Numero de licencia ya existe';
            }
        }

        if (!$editando || (!empty($data['codigo_equipo']))){
            if (!is_string($data['codigo_equipo'])){
                $errores['codigo_equipo'] = 'Codigo de equipo debe ser un texto';
            }else if ($equipoModelo->find($data['codigo_equipo']) === false){
                $errores['codigo_equipo'] = 'Codigo de equipo no existe';
            }
        }

        if (!$editando || (!empty($data['numero']))){
            if (filter_var($data['numero'], FILTER_VALIDATE_INT) === false){
                $errores['numero'] = 'Numero  debe ser un numero entero';
            }else if ($data['numero'] < 0 || $data['numero'] > 99){
                $errores['numero'] = 'Numero debe ser un numero entre 0-99';
            }
        }

        if (!$editando || isset($data['nome'])) {
            if ($editando && empty($data['nome'])) {
                $errores['nome'] = 'Nombre no puede estar vacío';
            } else if (!is_string($data['nome'])) {
                $errores['nome'] = 'Nombre debe ser un texto';
            } else if (strlen($data['nome']) > 30) {
                $errores['nome'] = 'Nombre debe tener máximo 30 caracteres';
            }
        }


        if (!$editando || (!empty($data['posicion']))) {
            if ( !in_array($data['posicion'], ['A','B','E','F','P']) ) {
                $errores['posicion'] = 'Posicion no valida (A, B, E, F ,P)';
            }
        }

        if (!$editando || (!empty($data['nacionalidade']))) {
             if (!is_string($data['nacionalidade'])) {
                 $errores['nacionalidade'] = 'Nacionalidad debe ser un texto';
             }else if (strlen($data['nacionalidade']) > 3) {
                 $errores['nacionalidade'] = 'Nacionalidad debe tener maximo 3 caracteres';
             }else if ($nacionalidadeModel->find($data['nacionalidade']) === false){
                 $errores['nacionalidade'] = 'Nacionalidad no existe';
             }
        }

        if (!$editando || (!empty($data['ficha']))) {
            if ( !in_array($data['ficha'], ['JFL','EXT','EUR','COT']) ) {
                $errores['ficha'] = 'Ficha no valida (JFL, EXT, EUR, COT)';
            }
        }

        if (!$editando || (!empty($data['estatura']))) {
            if ($data['estatura'] < 1.00 || $data['estatura'] > 2.90) {
                $errores['estatura'] = 'Estatura entre 1 y 2.90.';
            }
        }

        if (!$editando || (!empty($data['data_nacemento']))) {
            if (!is_string($data['data_nacemento'])) {
                $errores['data_nacemento'] = 'Data de nacemento debe ser un texto';
            }else if (DateTime::createFromFormat('Y-m-d', $data['data_nacemento']) === false){
                $errores['data_nacemento'] = ' Formato Y-m-d';
            }
        }

        if (!$editando || (!empty($data['temporadas']))) {
            if ($data['temporadas'] < 1 || $data['temporadas'] > 40) {
                $errores['temporadas'] = 'Temporadas entre 1 y 40.';
            }
        }

        return $errores;
    }

}