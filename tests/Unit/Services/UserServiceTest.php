<?php

namespace Tests\Unit\Services;

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
            'email' => fake()->name(),
            'name' => fake()->email(),
            'password' => '123456'
        ];

        $user = $this->userService->create($userData);
        $this->assertNotEquals($userData['password'], $user->pass);
    }
}

