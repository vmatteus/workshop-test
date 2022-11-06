<?php

namespace Tests\Unit\Repositories;

use App\Models\User;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\UserRepository;
use Tests\TestCase;

class UserRepositoryTest extends TestCase
{

    private $userRepository;

    public function setUp() : void
    {
        parent::setUp();

        $this->userRepository = app(UserRepository::class);

    }

    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_create_user()
    {

        $userData = [
            'email' => 'email@email.com',
            'name' => 'João Silva',
            'password' => '123456'
        ];

        $user = $this->userRepository->create($userData);

        $this->assertInstanceOf(User::class, $user);
        $this->assertEquals($userData['email'], $user->email);
        $this->assertEquals($userData['name'], $user->name);
        $this->assertEquals($userData['password'], $user->password);

    }
}
