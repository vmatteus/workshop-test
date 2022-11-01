<?php

namespace Tests\Unit;

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

        $this->assertInstanceOf(User::class, $this->userRepository->create([
            'email' => 'dqwdq@dwqdq.com',
            'name' => 'Vini',
            'password' => '123'
        ]));

    }
}
