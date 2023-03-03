<?php

namespace app\modules\admin\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;


class AppAdminController extends Controller{

    public function behaviors(){
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

}

// example-admin: username - admin, password - 123, password-hash - $2y$10$ucb0xN15rbxHLY9o5hXHceoHTHSCUqe3k3iThuC/QE7Rlt/BcYyHK