<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\Request;
class UserController extends Controller
{

    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * @var Request $request
     * @return User|\Exception
     */
    public function create(Request $request) {

        $data = $request->all();

        $validator = validator($data, [
            'name' => 'required',
            'email' => 'required|email|unique:users|email',
            'password' => 'required|size:6',
        ]);

        if (!$validator->fails($validator)) {
            return [
                'success'=> true,
                'msg' => 'Usuário criado!',
                'user' => $this->userService->create($data)
            ];
        } else {
            return [
                'success'=> false,
                'errors' => $validator->errors(),
            ];
        }
    }
}
