<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});


$router->get('/materi', 'MateriController@index');
$router->get('/materi/{id}', 'MateriController@show');
$router->post('/materi-create', 'MateriController@store');
$router->put('/materi-update/{id}', 'MateriController@update');
$router->delete('/materi-delete/{id}', 'MateriController@destroy');

$router->get('/kelas', 'KelasController@index');
$router->get('/kelas/{id}', 'KelasController@show');
$router->post('/kelas-create', 'KelasController@store');
$router->put('/kelas-update/{id}', 'KelasController@update');
$router->delete('/kelas-delete/{id}', 'KelasController@destroy');

$router->get('/pertemuan', 'PertemuanController@index');
$router->get('/pertemuan/{id}', 'PertemuanController@show');
$router->post('/pertemuan-create', 'PertemuanController@store');
$router->put('/pertemuan-update/{id}', 'PertemuanController@update');
$router->delete('/pertemuan-delete/{id}', 'PertemuanController@destroy');

$router->get('/user', 'UserController@index');
$router->get('/user/{id}', 'UserController@show');



$router->get('/guru', 'GuruController@index');
$router->get('/guru/{id}', 'GuruController@show');
$router->put('/guru-update/{id}', 'GuruController@update');


$router->get('/tugas', 'TugasController@index');
$router->get('/tugas/{id}', 'TugasController@show');

$router->get('/murid', 'MuridController@index');
$router->get('/murid/{id}', 'MuridController@show');

$router->get('/absensi', 'AbsensiController@index');
$router->get('/absensi/{id}', 'AbsensiController@show');

$router->post('/login', 'AuthController@login');
$router->post('/register', 'AuthController@register');

