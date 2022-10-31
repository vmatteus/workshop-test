<?php

namespace App\Repositories;

use App\Repositories\Contracts\FindUserByIdRepository;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Repositories\Contracts\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface
{
    /**
     * @var Model|User
     */
    private Model $model;

    public function __construct()
    {
        $this->model = new User();
    }

    /**
     * @param array $data
     * @return User|\Exception
     */
    public function create(array $data) : User
    {
        return $this->model->create($data);
    }
}
