<?php
declare(strict_types=1);
namespace Com\Daw2\Models;

class XogadoresModel extends \Com\Daw2\Core\BaseDbModel
{
    public const CAMPOS_ORDER = ['x.numero_licencia','e.nome_equipo','x.nome','x.estatura','x.data_nacemento'];
    public function getXogadores(array $data):array
    {
        $numero_paginas = $this->numeroRegistros();
        $max_page = $this->getMaxPage($numero_paginas);

        if (isset($data['page']) && filter_var($data['page'], FILTER_VALIDATE_INT) !== false) {
            $page = (int) $data['page'];
            if ($page < 1 || $page > $max_page) {
                throw new \InvalidArgumentException('la pagina no es valida');
            }
        } else {
            $page = 1;
        }

        if (isset($data['order']) && filter_var($data['order'], FILTER_VALIDATE_INT) !== false) {
            $order = (int) $data['order'];
            if ($order < 1 || $order > count(self::CAMPOS_ORDER)) {
                throw new \InvalidArgumentException('El orden no es valido');
            }
        }else{
            $order = 1;
        }

        if (isset($data['sentido'])){
            $sentido = $data['sentido'];
            if (!in_array(strtolower($sentido),['asc','desc'])){
                throw new \InvalidArgumentException('El sentido no es valido solo ASC o DESC');
            }
        }else{
            $sentido = 'asc';
        }

        $condiciones = [];
        $valores = [];

        if (!empty($data['numero_licencia'])){
            if (filter_var($data['numero_licencia'], FILTER_VALIDATE_INT) === false || $data['numero_licencia'] < 1 ) {
                throw new \InvalidArgumentException('El numero licencia no es valido debe ser un entero mayor a 0');
            }else{
                $condiciones[] = 'x.numero_licencia LIKE :numero_licencia';
                $valores['numero_licencia'] = '%'.$data['numero_licencia'].'%';
            }
        }

        if (!empty($data['codigo_equipo'])){
            if (!is_string($data['codigo_equipo'])){
                throw new \InvalidArgumentException('El codigo equipo no es valido');
            }else{
                $condiciones[] = 'x.codigo_equipo = :codigo_equipo';
                $valores['codigo_equipo'] = $data['codigo_equipo'];
            }
        }

        if (!empty($data['nome_equipo'])){
            if (!is_string($data['nome_equipo'])){
                throw new \InvalidArgumentException('El nombre equipo no es valido');
            }else{
                $condiciones[] = 'e.nome_equipo LIKE :nome_equipo';
                $valores['nome_equipo'] = '%'.$data['nome_equipo'].'%';
            }
        }

        if (!empty($data['nome_xogador'])){
            if (!is_string($data['nome_xogador'])){
                throw new \InvalidArgumentException('El nombre xogador no es valido');
            }else{
                $condiciones[] = 'x.nome LIKE :nome_xogador';
                $valores['nome_xogador'] = '%'.$data['nome_xogador'].'%';
            }
        }

        if (!empty($data['min_estatura'])){
            $condiciones[] = 'x.estatura >= :min_estatura';
            $valores['min_estatura'] = $data['min_estatura'];
        }

        if (!empty($data['max_estatura'])){
            $condiciones[] = 'x.estatura <= :max_estatura';
            $valores['max_estatura'] = $data['max_estatura'];
        }



        $sql = "SELECT x.numero_licencia,x.codigo_equipo ,x.numero , x.nome , x.posicion ,x.nacionalidade , x.ficha , x.estatura , x.data_nacemento , x.temporadas  
                FROM xogador x 
                LEFT JOIN equipo e on e.codigo  = x.codigo_equipo ";
        if (!empty($condiciones)){
            $sql .= 'WHERE '.implode(' AND ',$condiciones);
        }
        $sql .= ' ORDER BY ' . self::CAMPOS_ORDER[$order-1] . ' ' . $sentido;
        $sql .= ' LIMIT ' . ($page-1)*$_ENV['limite.pagina'] . ',' . $_ENV['limite.pagina'];
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($valores);
        return $stmt->fetchAll();
    }

    public function getByNumeroLicencia(int $numeroLicencia):array | false
    {
            $sql = " SELECT * FROM xogador WHERE numero_licencia = :numero_licencia ";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['numero_licencia' => $numeroLicencia]);
            return $stmt->fetch();
    }

    public function deleteByNumeroLicencia(int $numeroLicencia):bool
    {
        $sql = " DELETE FROM xogador WHERE numero_licencia = :numero_licencia ";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['numero_licencia' => $numeroLicencia]);
        return $stmt->rowCount() > 0;
    }

    public function updateXogador(array $data, int $numeroLicencia):bool
    {
        if (!empty($data)){
            $sql = " UPDATE xogador SET ";
            $campos = [];
            foreach ($data as $campo => $value) {
                $campos[] = " $campo = :$campo ";
            }

            if (empty($campos)) {
                return false;
            }

            $sql .= implode(', ',$campos);
            $sql .= " WHERE numero_licencia = :numero_licencia ";
            $data['numero_licencia'] = $numeroLicencia;
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute($data);
        }else{
            return false;
        }
    }

    public function numeroRegistros(): int
    {
        $sql = "SELECT COUNT(*) FROM xogador x LEFT JOIN equipo e on e.codigo  = x.codigo_equipo ";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return (int) $stmt->fetchColumn();
    }

    public function getMaxPage(int $numeroRegistros): int
    {
        return (int)ceil($numeroRegistros/$_ENV['limite.pagina']);
    }
}