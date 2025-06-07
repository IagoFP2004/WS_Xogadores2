<?php
declare(strict_types=1);
namespace Com\Daw2\Models;

use Com\Daw2\Core\BaseDbModel;

class NacionalidadeModel extends BaseDbModel
{
    public function find(string $codigoNacionalidade): array | false
    {
        $sql = "SELECT * FROM nacionalidade WHERE codigo = :codigoNacionalidade";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['codigoNacionalidade' => $codigoNacionalidade]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }
}