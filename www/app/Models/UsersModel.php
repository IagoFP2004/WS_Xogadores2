<?php
declare(strict_types=1);
namespace Com\Daw2\Models;

use Com\Daw2\Core\BaseDbModel;

class UsersModel extends BaseDbModel
{
    public function getByEmail($email): array | false
    {
        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['email' => $email]);
        return $stmt->fetch();
    }

    public function updatePassword(string $email, string $newPassword): bool
    {
        $sql = "UPDATE users SET password = :password WHERE email = :email";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute(['password' => password_hash($newPassword, PASSWORD_DEFAULT), 'email' => $email]);
    }
}