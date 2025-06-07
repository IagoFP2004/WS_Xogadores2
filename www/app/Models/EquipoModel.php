<?php
declare(strict_types=1);
namespace Com\Daw2\Models;

use Com\Daw2\Core\BaseDbModel;

class EquipoModel extends BaseDbModel
{
    public function find(string $codigoEquipo): array | false
    {
        $sql =" SELECT DISTINCT e.codigo FROM equipo e WHERE e.codigo = :codigoEquipo ";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['codigoEquipo' => $codigoEquipo]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }
}