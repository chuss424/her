<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Form;
use App\Http\Controllers\Controller as BaseController;
use Illuminate\Support\Facades\Storage;
use Litepie\Theme\ThemeAndViews;
use Litepie\User\Traits\RoutesAndGuards;
use Litepie\User\Traits\UserPages;
use App\Http\Response\ResourceResponse;

use Illuminate\Support\Facades\Auth;
use App;
use App\orders;
use App\orders_details;
use App\orders_users;
use App\usuarios;
use App\productos;
use App\det_products;
use App\categoria;
use App\categoria_productos;
use App\notify;

class OrdersControllers extends Controller
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
    	$iduser = Auth::user()->id;
    	$usuario = usuarios::where('id',$iduser)->first();
    	if ($usuario->user_id == null) {
    		$usuario->user_id = $iduser;
    	}
    	$admin = usuarios::where('id',$usuario->user_id)->first();
    	$orders = orders::where('status','0')->orderBy('updated_at','desc')->paginate(15);
    	//$send = orders::where('status','0')->orderBy('updated_at','desc')->paginate(15);
    	$receiver= \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders_users.id_users_receiver',$iduser)
        ->paginate(15);

    	$send = \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders_users.id_users_sender',$iduser)
        ->paginate(15);

        $receiver_root= \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders_users.id_users_receiver',$iduser)
        ->paginate(15);


        $success = \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at',  'orders.observation', 'orders_users.id_users_receiver', 'orders_users.id_users_sender', 'orders.nombre_cliente')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders.status','1')
        ->orwhere('orders_users.id_users_receiver',$iduser)
        ->OrderBy('created_at','des')
        ->paginate(15);

        foreach ($success as $key => $value) {
            $search_rec = usuarios::where('id',$value->id_users_receiver)->first();
            $search_send = usuarios::where('id',$value->id_users_sender)->first();
            $success[$key]->id_users_receiver = $search_rec->name;
            $success[$key]->id_users_sender = $search_send->name;
        }

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('name','asc')->get();


        if(Auth::user()->designation=='Sucursal')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_sucursal')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }

        if(Auth::user()->designation=='Administrador')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_admin')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }
        elseif(Auth::user()->designation=='Super usuario')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_susuario')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }
    }

    public function crear(request $request)
    {
    	
    	$iduser = Auth::user()->id;
        $nameuser = Auth::user()->name;
        $cliente = usuarios::find(Auth::user()->user_id);
        //dd($cliente);

    	$order= New orders;
    	$order->title = $request->input('title');
    	$order->description = $request->input('description');
    	$order->status = '0';
        $order->nombre_cliente = $cliente->name;
        $order->dni_cliente = $cliente->ruc;
        $order->tel_cliente = $cliente->phone;
        $order->correo_cliente = $cliente->email;
        $order->dir_cliente = $cliente->state.', '.$cliente->district.', '.$cliente->city.', '.$cliente->address.'.';
        /*$order->id_product = $request->input('producto');
        $order->id_det_pro = $request->input('det_producto');
        $order->cant = $request->input('cantidad');*/
    	$order->save();

        $producto = $request->input('producto');
        $cantidad = $request->input('cantidad');

        foreach ($producto as $key =>$value ) {
            $separar = explode('-',$value);
            $id_producto = $separar[0];
            $id_det_producto = $separar[1];
            if ($value!=null) {
                $det_order = New orders_details;
                $det_order->id_order = $order->id;
                $det_order->id_product = $id_producto;
                $det_order->id_det_pro = $id_det_producto;
                $det_order->cant = $cantidad[$key];
                $det_order->save();
            }
        }

    	$order_user = New orders_users;
    	$order_user->id_orders = $order->id;
    	$order_user->id_users_sender = $iduser;
    	$order_user->id_users_receiver = $request->input('receiver');
    	$order_user->save();

        $notify= New notify;
        $notify->titulo = 'Tienes una solicitud de '.$order->title;
        $notify->url = 'admin/solicitud';
        $notify->read_n = '0';
        $notify->name = $nameuser;
        $notify->id_user_receiver = $request->input('receiver');
        $notify->save();

    	return redirect("/admin/solicitud");

    }


    public function receiver()
    {
    	$receiver = orders::find($_GET['id']);
        $det_order = orders_details::where('id_order',$receiver->id)->get();
        $producto = productos::find($receiver->id_product);
        $det_producto = det_products::orderBy('id','asc')->get();
    	echo json_encode(['conten' => $receiver, 'producto' => $producto, 'det' => $det_producto, 'det_order' => $det_order]);
    }

    public function detalle_order($id)
    {
        if(Auth::user()->designation=='Administrador')
        {
        $order = orders::find($id);
        $det_order = orders_details::where('id_order',$id)->get();
        $det_producto = det_products::orderBy('id','asc')->get();
        $order_user = orders_users::where('id_orders',$id)->first();
        $usuario = usuarios::where('id',$order_user->id_users_sender)->first();
        return $this->response->title('Dashboard')
        ->view('messages.messages_details_a')
        ->data(['order' => $order, 'det_order' => $det_order, 'menu' => 'Solicitudes', 'det_producto' => $det_producto, 'order_user' => $order_user, 'usuario' => $usuario])
        ->output();
        }

        if(Auth::user()->designation=='Super usuario')
        {
        $order = orders::find($id);
        $det_order = orders_details::where('id_order',$id)->get();
        $det_producto = det_products::orderBy('id','asc')->get();
        return $this->response->title('Dashboard')
        ->view('messages.messages_details_h')
        ->data(['order' => $order, 'det_order' => $det_order, 'menu' => 'Solicitudes', 'det_producto' => $det_producto])
        ->output();
        }
    }

    public function detalle_modificar($id,$quantity)
    {
        //dd($quantity);
        $det_order = orders_details::where('id',$id)->first();
        //dd($det_order);
        $det_order->cant = $quantity;
        $det_order->save();

        return redirect("/admin/solicitud/detalle/".$det_order->id_order);
    }

    public function responder(request $request)
    {
        //dd($request->all());

        if ($request->input('form_title') == 'admin') {
            $iduser = Auth::user()->designation.' - '.Auth::user()->name;
    
            $order= orders::find($request->input('id'));
            $order->status = $request->input('status');
            $order->observation = $request->input('obs');
            $order->save();
    
            $order_user= orders_users::where('id_orders',$request->input('id'))->first();
            $user_send = usuarios::find($order_user->id_users_sender);
            $user_receiver = usuarios::find($order_user->id_users_receiver);
    
            if($request->input('status')=='1')
            {
            $mensaje = 'Aprobado';
            }
            else
            {
            $mensaje = 'Rechazado';  
            }
    
            $notify= New notify;
            $notify->titulo = 'Han '.$mensaje.' tu solicitud '.$order->title;
            $notify->url = 'admin/solicitud';
            $notify->read_n = '0';
            $notify->name = $iduser;
            $notify->id_user_receiver = $user_send->id;
            $notify->save();

            $notify= New notify;
            $notify->titulo = $iduser.' ha '.$mensaje.' una solicitud '.$order->title;
            $notify->url = 'admin/solicitud';
            $notify->read_n = '0';
            $notify->name = $iduser;
            $notify->id_user_receiver = $user_receiver->user_id;
            $notify->save();
        }

        /*if ($request->input('form_title') == 'user') {
            $iduser = Auth::user()->designation.' - '.Auth::user()->name;
    
            $order= orders::find($request->input('id'));
            $order->cant = $request->input('cant');
            $order->save();
    
            $order_user= orders_users::where('id_orders',$request->input('id'))->first();
            $user_send = usuarios::find($order_user->id_users_receiver);
    
            $notify= New notify;
            $notify->titulo = 'Han modificado la solicitud '.$order->title;
            $notify->url = 'admin/solicitud';
            $notify->read_n = '0';
            $notify->name = $iduser;
            $notify->id_user_receiver = $user_send->id;
            $notify->save();
        }*/
        


    	return redirect("/admin/solicitud");
    }

    public function consulta_ajax()
    {
        //$det_products = det_products::find($_GET['id']);
        $det_products= \DB::table('det_products')
            ->join('det_products_productos', 'det_products.id', '=', 'det_products_productos.det_products_id')
            ->where('det_products_productos.productos_id',$_GET['id'])
            ->get();
        echo json_encode(['productos' => $det_products]);
    }

    public function consulta_ajax_det()
    {
        //$det_products = det_products::find($_GET['id']);
        $det_products= det_products::where('cod',$_GET['id'])->first();
        echo json_encode(['productos' => $det_products]);
    }

    public function notify_view()
    {
        $notify = notify::where('id_user_receiver',$_GET['id'])->get();
        foreach ($notify as $key => $value) {
            $value->read_n = '1';
            $value->save();
        }
        echo json_encode(['productos' => $notify]);
    }

    public function order($order)
    {
        $iduser = Auth::user()->id;
        switch ($order) {
         case 'espera':
            $receiver= \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_receiver',$iduser)
            ->where('orders.status','0')
            ->paginate(15);

            $send = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_sender',$iduser)
            ->where('orders.status','0')
            ->paginate(15);

            $success = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at', 'orders.observation', 'orders_users.id_users_receiver', 'orders_users.id_users_sender')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders.status','1')
            ->orwhere('orders_users.id_users_receiver',$iduser)
            ->paginate(15);
         break;
         case 'aprobado':
            $receiver= \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_receiver',$iduser)
            ->where('orders.status','1')
            ->paginate(15);

            $send = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_sender',$iduser)
            ->where('orders.status','1')
            ->paginate(15);

            $success = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at', 'orders.observation', 'orders_users.id_users_receiver', 'orders_users.id_users_sender')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders.status','1')
            ->orwhere('orders_users.id_users_receiver',$iduser)
            ->paginate(15);
         break;
         case 'rechazado':
            $receiver= \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_receiver',$iduser)
            ->where('orders.status','2')
            ->paginate(15);

            $send = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_sender',$iduser)
            ->where('orders.status','2')
            ->paginate(15);

            $success = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at', 'orders.observation', 'orders_users.id_users_receiver', 'orders_users.id_users_sender')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders.status','1')
            ->orwhere('orders_users.id_users_receiver',$iduser)
            ->paginate(15);
         break;
          }

        
        $usuario = usuarios::where('id',$iduser)->first();
        if ($usuario->user_id == null) {
            $usuario->user_id = $iduser;
        }
        $admin = usuarios::where('id',$usuario->user_id)->first();
        $orders = orders::where('status','0')->orderBy('updated_at','desc')->paginate(15);

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('name','asc')->get();
         
        if(Auth::user()->designation=='Sucursal')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_sucursal')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }

        if(Auth::user()->designation=='Administrador')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_admin')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }
        elseif(Auth::user()->designation=='Super usuario')
        {
        return $this->response->title('Dashboard')
            ->view('messages.messages_susuario')
            ->data(['receiver' => $receiver, 'send' => $send, 'menu' => 'Solicitudes', 'admin' => $admin,'categoria' => $categoria, 'productos' => $productos, 'receiver_root' => $success])
            ->output();
        }
    }

}
