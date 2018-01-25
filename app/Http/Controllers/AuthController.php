<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use App;
use Illuminate\Support\Facades\Input;
use App\User;
use App\productos;
use App\det_products;
use App\categoria;
use App\categoria_productos;
use App\type_pro;
use App\usuarios;
use App\role_user;

class AuthController extends Controller
{
    public function showLogin()
    {
        // Verificamos que el usuario no esté autenticado
        if (Auth::check())
        {
            // Si está autenticado lo mandamos a la raíz donde estara el mensaje de bienvenida.
            return Redirect::to('cliente');
        }
        // Mostramos la vista login.blade.php (Recordemos que .blade.php se omite.)
        return View('login');
    }

    public function postLogin()
    {
        // Guardamos en un arreglo los datos del usuario.
        $userdata = array(
            'email' => Input::get('email'),
            'password'=> Input::get('password')
        );
        //dd($userdata);
        // Validamos los datos y además mandamos como un segundo parámetro la opción de recordar el usuario.
        //dd(Auth::attempt($userdata));
        if(Auth::attempt($userdata, Input::get('remember-me', 0)))
        {
            // De ser datos válidos nos mandara a la bienvenida
            return Redirect('/');
        }
        // En caso de que la autenticación haya fallado manda un mensaje al formulario de login y también regresamos los valores enviados con withInput().
        return Redirect('/')
                    ->with('mensaje_error', 'Tus datos son incorrectos')
                    ->withInput();
    }

    public function logOut()
    {
        Auth::logout();
        return Redirect('/')
                    ->with('mensaje_error', 'Tu sesión ha sido cerrada.');
    }

    public function register_view()
    {
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Registro nuevo cliente';
        return view('registrar',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function register(Request $request)
    {
        //dd($request->all());

        $user = New usuarios;
        $user->name = $request->input('nombre');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('password'));
        $user->api_token = str_random(60);
        $user->sex = $request->input('genero');
        $user->designation = 'Cliente';
        $user->dni = $request->input('dni');
        $user->mobile = $request->input('celular');
        $user->phone = $request->input('telefono');
        $user->address = $request->input('direccion');
        $user->city = $request->input('distrito');
        $user->district = $request->input('provincia');
        $user->state = $request->input('departamento');
        $user->Status= 'Active';
        $user->user_id= '14';
        $user->save();

        $role = New role_user;
        $role->role_id = '1';
        $role->user_id = $user->id;
        $role->save();

        //return redirect("/admin/usuarios");
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'mensaje';
        $name_page = 'Iniciar sesión cliente';
        return view('sesion',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function sesion_view()
    {
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Iniciar sesión cliente';
        return view('sesion',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function modify(Request $request)
    {
        

        $user = usuarios::where('id',$request->input('id_cuenta'))->first();
        
        if ($request->input('form_m') == '1')
        {
            $user->name = $request->input('nombre');
            $user->sex = $request->input('genero');
            $user->dni = $request->input('dni');
            $user->mobile = $request->input('celular');
            $user->phone = $request->input('telefono');
            $user->address = $request->input('direccion');
            $user->city = $request->input('distrito');
            $user->district = $request->input('provincia');
            $user->state = $request->input('departamento');
        }
        else
        {
            //dd($request->all());
            $user->password = bcrypt($request->input('password'));
            
        }
        $user->save();
        return redirect("/cliente/cuenta");
        /*$productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'mensaje';
        return view('sesion',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active]);*/
    }
}
