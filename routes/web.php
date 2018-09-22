<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
Route::get('/test','HomeController@test')->name('testpay');
Route::get('/', 'HomeController@index')->name('home');
Route::get('/detail/{id}','HomeController@detail')->name('detail');
Route::get('/home','HomeController@home')->name("userCenter");
Route::get('/apply','HomeController@apply')->name("apply");
Route::post("/apply/{id}",'HomeController@apply_store')->name('applystore');
Route::post('/uploadPic','HomeController@uploadimg')->name("uploadpic");
Route::get('/queryOrder/{orderNo}','PayController@queryOrder')->name('queryOrder');
Route::group(['middleware' => ['auth','web', 'wechat.oauth']], function () {
    Route::get('/pay/weixin', 'PayController@pay')->name('JSAPI');
});