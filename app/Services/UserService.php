<?php

namespace App\Services;

use App\Models\User;
use App\Repositories\Contracts\UserRepositoryInterface;

class UserService
{

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * @var array $data
     * @return User|\Exception
     */
    public function create(array $data) : User
    {
        $data['password'] = encrypt($data['password']);
        return $this->userRepository->create($data);
    }
}
