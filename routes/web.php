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

Route::get('/', 'HomeController@index')->name('home');
Route::get('/detail','HomeController@detail')->name('detail');
Route::get('/home','HomeController@home')->name("userCenter");
Route::get('/apply','HomeController@apply')->name("apply");
Route::post('/uploadPic','HomeController@uploadimg')->name("uploadpic");