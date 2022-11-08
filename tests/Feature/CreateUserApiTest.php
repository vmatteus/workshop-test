<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\TestCase;

class CreateUserApiTest extends TestCase
{

    public function test_create_user_success()
    {

        $response = $this->json('POST', route('create-user'), [
            'name' => fake()->name(),
            'email' => fake()->email(),
            'password' => '123456'
        ]);
        $response->assertJson([
            'success' => true,
            'msg' => "Usuário criado!"
        ]);
    }

    public function test_create_user_fail_email_unique()
    {

        $user = User::factory()->create();

        $response = $this->json('POST', route('create-user'), [
            'name' => $user->name,
            'email' => $user->email,
            'password' => '123456'
        ]);

        $response->assertJson([
            'success' => false,
            'errors' => [
                'email' => ["The email has already been taken."]
            ]
        ]);
    }

    public function test_create_user_fail_password_small()
    {

        $response = $this->json('POST', route('create-user'), [
            'name' => fake()->name(),
            'email' => fake()->email(),
            'password' => '1234'
        ]);

        $response->assertJson([
            'success' => false,
            'errors' => [
                'password' => ["The password must be 6 characters."]
            ]
        ]);
    }
}
