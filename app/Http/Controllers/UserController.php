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

        return [
            'success'=> true,
            'msg' => 'UserController.create',
            'user' => $this->userService->create($request->all())
        ];

    }
}
