<?php

namespace App\Repositories\Contracts;

use App\Models\User;

interface UserRepositoryInterface
{
    /**
     * @param int $id
     * @return array
     */
    public function create(array $data) : User;
}
