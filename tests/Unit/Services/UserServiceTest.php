<?php

namespace Tests\Unit\Service;

use App\Services\UserService;
use Tests\TestCase;

class UserServiceTest extends TestCase
{

    private $userService;

    public function setUp() : void
    {
        parent::setUp();
        $this->userService = app(UserService::class);
    }

    public function test_create_user_password()
    {

        $userData = [
            'email' => 'email@email.com',
            'name' => 'João Silva',
            'password' => '123456'
        ];

        $user = $this->userService->create($userData);
        $this->assertNotEquals($userData['password'], $user->pass);
    }
}

