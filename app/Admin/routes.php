<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
   
    $router->get('/', 'HomeController@index');
    $router->resource('users', UserController::class);
    $router->resource('debit-credit', DCController::class);
    $router->resource('banner', BannerController::class);
    $router->get('/debit-credit/users/{id}','DCController@show');
    $router->get('manual/charge','ManualController@charge');
    $router->post('manual/charge','ManualController@postCharge');
    $router->get('manual/refund','ManualController@refund');
    $router->post('manual/refund','ManualController@postRefund');
});
