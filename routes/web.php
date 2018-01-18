<?php

/*
|--------------------------------------------------------------------------
|  Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', 'PublicController@home');
Route::get('/acerca-hermer', 'PublicController@somos');
Route::get('/productos/{cat}/{pro?}', 'PublicController@url');
Route::get('/consulta_form_ajax/producto', 'PublicController@consulta_ajax');
Route::get('/producto/{id}', 'PublicController@producto');
Route::get('/contactenos', 'PublicController@contactar');
Route::get('/resultado-busqueda', 'PublicController@busqueda');

// Validamos los datos de inicio de sesión.
Route::post('cliente/login', 'AuthController@postLogin');
Route::get('cliente/registro', 'AuthController@register_view');
Route::post('cliente/registrar', 'AuthController@register');
Route::get('cliente/iniciar_sesion', 'AuthController@sesion_view');
Route::get('/ajax/cliente', 'PublicController@agregar_carrito');
Route::get('/confirmar_carrito', 'PublicController@solicitar_producto');
Route::get('/eliminar_carrito', 'PublicController@descartar_producto');
/*Route::get("/ajax/cliente", function() {
    Mail::send("emails.SolicitarPro", [], function($message) {
        $message->to("jesus.espinoza@yainso.com", "Luis Garcia")
        ->subject("Bienvenido a Aprendible!");
    });
});*/

// Nos indica que las rutas que están dentro de él sólo serán mostradas si antes el usuario se ha autenticado.
Route::group(array('before' => 'auth'), function()
{
    // Esta será nuestra ruta de bienvenida.
    Route::get('cliente', function()
    {
        return View::make('hello');
    });
    // Esta ruta nos servirá para cerrar sesión.
    Route::get('cliente/logout', 'AuthController@logOut');
    Route::get('cliente/carrito', 'PublicController@carrito');
    Route::get('cliente/cuenta', 'PublicController@cuenta');
    Route::get('/ajax', 'PublicController@receiver');
    Route::post('cliente/modificar', 'AuthController@modify');

});


Route::group(['prefix' => set_route_guard('web')], function () {
    Auth::routes();
    Route::get('/', 'ResourceController@home');
});

Route::group(['prefix' => set_route_guard('web').'/productos'], function () {
    Route::get('/', 'ProductsController@home');
    Route::get('/crear', 'ProductsController@vista_crear');
    Route::get('/modificar/{id}', 'ProductsController@vista_modificar');
    Route::post('/editar', 'ProductsController@modificar_guardar');
    Route::post('/crear_nuevo', 'ProductsController@crear');
    Route::get('/orden/{order}', 'ProductsController@order');
    Route::get('/borrar/{id}', 'ProductsController@borrar');
    Route::get('/borrar/det/{id}', 'ProductsController@borrar_det');
});

Route::group(['prefix' => set_route_guard('web').'/solicitud'], function () {
    Route::get('/', 'OrdersControllers@home');
    Route::post('/crear', 'OrdersControllers@crear');
    Route::get('/ajax', 'OrdersControllers@receiver');
    Route::get('notify/ajax', 'OrdersControllers@notify_view');
    Route::post('/responder', 'OrdersControllers@responder');
    Route::get('/consulta_form_ajax/producto', 'OrdersControllers@consulta_ajax');
    Route::get('/orden/{order}', 'OrdersControllers@order');
});

Route::group(['prefix' => set_route_guard('web').'/usuarios'], function () {
    Route::get('/', 'UsuariosController@home');
    Route::post('/crear', 'UsuariosController@crear');
    Route::get('/borrar/{id}', 'UsuariosController@borrar');
    Route::get('/recuperar/{id}', 'UsuariosController@recuperar');
    Route::get('/stop', 'UsuariosController@stop');
});

Route::group(['prefix' => set_route_guard('web').'/perfil'], function () {
    Route::get('/', 'UsuariosController@perfil');
    Route::post('/modificar', 'UsuariosController@perfil_modificar');
});

Route::group(['prefix' => set_route_guard('web').'/categoria'], function () {
    Route::get('/', 'ProductsController@view_cat');
    Route::post('/crear', 'ProductsController@crear_cat');
    Route::get('/borrar/{id}', 'ProductsController@borrar_cat');
});

Route::group(['prefix' => set_route_guard('web').'/configuracion'], function () {
    Route::get('/', 'ProductsController@view_cat');
    Route::get('/producto', 'ProductsController@view_type');
    Route::post('/crear_tipo', 'ProductsController@crear_type');
    Route::get('/borrar_type/{id}', 'ProductsController@borrar_type');
});

