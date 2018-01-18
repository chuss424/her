<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as BaseController;
use Litepie\Theme\ThemeAndViews;
use Litepie\User\Traits\RoutesAndGuards;
use Litepie\User\Traits\UserPages;
use App\Http\Response\ResourceResponse;

use Illuminate\Support\Facades\Auth;
use App;
use App\usuarios;
use App\role_user;


class UsuariosController extends Controller
{
    use RoutesAndGuards, ThemeAndViews, UserPages;

    /**
     * Initialize public controller.
     *
     * @return null
     */
    public function __construct()
    {
        if (!empty(app('auth')->getDefaultDriver())) {
            $this->middleware('auth:' . app('auth')->getDefaultDriver());
            $this->middleware('role:' . $this->getGuardRoute());
        }
        $this->response = app(ResourceResponse::class);
        $this->setTheme();
    }

    /**
     * Show dashboard for each user.
     *
     * @return \Illuminate\Http\Response
     */
    public function home()
    {
        if (Auth::user()->designation == 'Sucursal') {
            return redirect("/admin/usuarios/stop");
        }
    	$iduser = Auth::user()->id;
    	$usuarios= usuarios::where('user_id',$iduser)->paginate(10);
    	//return view('usuarios.usuarios',['datos'=> $usuarios]);
        return $this->response->title('Dashboard')
            ->view('usuarios.usuarios')
            ->data(['datos' => $usuarios, 'menu' => 'Usuarios'])
            ->output();
    }

    public function crear(request $request)
    {
    	//dd($request->all());
        $iduser = Auth::user()->id;
    	$user = New usuarios;
        $user->name = $request->input('nombre');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('contraseña'));
        $user->api_token = str_random(60);
        $user->designation = $request->input('designacion');
        $user->Status= 'Active';
        $user->user_id= $iduser;
        $user->save();

        $role = New role_user;
        $role->role_id = '2';
        $role->user_id = $user->id;
        $role->save();
        return redirect("/admin/usuarios");
    }

    public function borrar($id)
    {
        $usuarios=usuarios::find($id);
        $usuarios->status = 'Suspended';
        $usuarios->password = bcrypt('lavalite1234');
        $usuarios->save();
        //$usuarios->delete();
        return redirect("/admin/usuarios");
    }

    public function recuperar($id)
    {
        $usuarios=usuarios::find($id);
        $usuarios->status = 'Active';
        $usuarios->password = bcrypt('1234');
        $usuarios->save();
        //$usuarios->delete();
        return redirect("/admin/usuarios");
    }

    public function perfil()
    {
        $iduser = Auth::user()->id;
        $usuarios= usuarios::where('user_id',$iduser)->paginate(10);
        //return view('usuarios.usuarios',['datos'=> $usuarios]);
        return $this->response->title('Dashboard')
            ->view('usuarios.profile')
            ->data(['datos' => $usuarios])
            ->output();
    }

    public function perfil_modificar(request $request)
    {
        $iduser = Auth::user()->id;
        $usuarios=usuarios::find($iduser);
        $usuarios->password = bcrypt($request->input('contraseña'));
        $usuarios->save();
        return redirect("/admin");
    }

    public function stop()
    {
        $iduser = Auth::user()->id;
        $usuarios= usuarios::where('user_id',$iduser)->paginate(10);
        //return view('usuarios.usuarios',['datos'=> $usuarios]);
        return $this->response->title('Dashboard')
            ->view('stop')
            ->output();
    }
}
