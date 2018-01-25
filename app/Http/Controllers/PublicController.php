<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use Litepie\Theme\ThemeAndViews;
use Litepie\User\Traits\RoutesAndGuards;
use App\Http\Response\PublicResponse;

use Illuminate\Support\Facades\Auth;
use App;
use App\productos;
use App\det_products;
use App\categoria;
use App\categoria_productos;
use App\type_pro;
use App\notify;
use App\orders;
use App\orders_users;
use App\orders_details;
use App\usuarios;
use App\carrito;
use Illuminate\Support\Facades\Mail;

class PublicController extends Controller
{
    use ThemeAndViews, RoutesAndGuards;

    /**
     * Initialize public controller.
     *
     * @return null
     */
    public function __construct()
    {
        $this->response = app(PublicResponse::class);
        $this->setTheme('public');
    }


    /**
     * Show dashboard for each user.
     *
     * @return \Illuminate\Http\Response
     */

    /*public function home()
    {
        return $this->response->title('Home')
            ->view('home')
            ->output();
    }*/

    public function home()
    {
        $productos = productos::orderBy('name','asc')->get();
        $det_productos = det_products::where('destacado','1')->orderBy('id','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'home';

        return view('home',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'det_productos' => $det_productos]);
    }

    public function somos()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'empresa';
        $name_page = 'Quiénes somos';

        return view('somos',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function faq()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'faq';
        $name_page = 'Preguntas frecuentes';

        return view('mantenimiento',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function cuentas()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'clientes';
        $name_page = 'Cuentas Bancarias';

        return view('cuenta_bancaria',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function despacho_clientes()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'clientes';
        $name_page = 'Despacho a clientes';

        return view('despacho_cliente',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function creditos_clientes()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'clientes';
        $name_page = 'Créditos a clientes';

        return view('credito_cliente',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function proveedor()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'proveedor';
        $name_page = 'Proveedor';

        return view('mantenimiento',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function url(Request $request,$id_url,$id_urls=""){
        
        //
        if ($id_urls!="") {
            $id_url=$id_url."/".$id_urls;
            $url=type_pro::where('url','/'.$id_url)->first();
            $data_cat = categoria::where('id',$url->id_categoria)->first();
            //$datos=categoria::where('url','/'.$id_url)->first();
            $productos = productos::where('type_pro',$url->id)->orderBy('name','asc')->get();
            $categoria = categoria::orderBy('id','asc')->get();
            $tipo = type_pro::orderBy('name','asc')->get();
            $active = 'productos';
            $name_page = 'Nuestros productos';
            return view('productos',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'datos' => $url, 'data_c' => $data_cat, 'active' => $active, 'name_page' => $name_page]);
        }
        elseif ($id_urls=="") {

            $datos=categoria::where('url','/'.$id_url)->first();
            $productos = productos::orderBy('name','asc')->get();
            $categoria = categoria::orderBy('id','asc')->get();
            $tipo = type_pro::orderBy('name','asc')->get();
            $active = 'productos';
            $name_page = 'Nuestros productos';
            return view('categoria',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'datos' => $datos, 'active' => $active, 'name_page' => $name_page]);
        }            
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

    public function producto($id)
    {
        $dato = productos::where('id',$id)->first();
        $type = type_pro::where('id',$id)->first();
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'productos';
        $name_page = 'Nuestros productos';
        return view('det_producto',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'datos' => $dato, 'type' => $type, 'active' => $active, 'name_page' => $name_page]);
    }

/* solicitud de producto desde pagina principal */
    public function solicitar_producto(request $request)
    {
        
        //dd($request->all());
        $iduser = Auth::user()->id;
        $nameuser = Auth::user()->name;
        $cliente = usuarios::find(Auth::user()->id);
        

        $order= New orders;
        $order->title = 'Pedido de cliente '.$request->input('name');
        $order->description = 'Pedido solicitado desde la pagina principal';
        $order->status = '1';
        $order->nombre_cliente = $request->input('name');
        $order->dni_cliente = $request->input('dni');
        $order->tel_cliente = $request->input('telefono');
        $order->correo_cliente = $request->input('correo');
        $order->dir_cliente = $request->input('direccion').'.';
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
        $order_user->id_users_receiver = $cliente->user_id;
        $order_user->save();

        $notify= New notify;
        $notify->titulo = 'Pedido de cliente '.$request->input('name');
        $notify->url = 'admin/solicitud';
        $notify->read_n = '0';
        $notify->name = $nameuser;
        $notify->id_user_receiver = $cliente->user_id;
        $notify->save();

        \Session::forget('cart');
        

        return Redirect('/cliente/carrito');
    }

    public function descartar_producto()
    {

        $carrito=carrito::find($_GET['carrito']);
        $carrito->delete();
        return Redirect('/cliente/carrito');
    }

/* solicitud de producto desde pagina principal */
    public function agregar_carrito()
    {
        $iduser = Auth::user()->id;

        $carrito = New carrito;
        $carrito->id_cliente = $iduser;
        $carrito->id_producto = $_GET['id'];
        $carrito->id_det_producto = $_GET['id_det'];
        $carrito->cantidad = $_GET['cant'];
        $carrito->save();
        

        echo json_encode(['mensaje' => 'exito']);
    }

    public function carrito()
    {
        if (Auth::check())
        {
            // Si está autenticado lo mandamos a la raíz donde estara el mensaje de bienvenida.
            $iduser = Auth::user()->id;
            $productos = productos::orderBy('name','asc')->get();
            $det_productos = det_products::orderBy('id','asc')->get();
            $categoria = categoria::orderBy('id','asc')->get();
            $tipo = type_pro::orderBy('name','asc')->get();
            $active = '';
            $send = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_sender',$iduser)
            ->paginate(15);
            $carrito = carrito::where('id_cliente',$iduser)->get();
            $name_page = 'Carrito';
            return view('carrito',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'send' => $send, 'carrito' => $carrito, 'det_productos' => $det_productos, 'name_page' => $name_page]);
        }
        return Redirect('/');

    }

    public function receiver()
    {
        if (Auth::check())
        {
            $receiver = orders::find($_GET['id']);
            $producto = productos::find($receiver->id_product);
            $det_producto = det_products::find($receiver->id_det_pro);
            echo json_encode(['conten' => $receiver, 'producto' => $producto, 'det' => $det_producto]);
        }
    }

    public function cuenta()
    {
        if (Auth::check())
        {
        $iduser = Auth::user()->id;
        $DatosCliente = usuarios::where('id',$iduser)->first();
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Cuenta';
        return view('cuenta',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'datos' => $DatosCliente, 'name_page' => $name_page]);
        }
        return Redirect('/');
    }

    public function contactar()
    {

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = 'contactenos';
        $name_page = 'Contáctenos';
        return view('contactar',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page]);
    }

    public function busqueda(Request $request){
        /* Especificación de datos como url y metas para botones de compartir del footer */
        
        $resultados_busqueda=productos::where('name','LIKE','%'.str_slug($request->buscar).'%')
        ->orWhere('marca','LIKE','%'.str_slug($request->buscar).'%')
        ->paginate(9);

        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';

        $busqueda = $request->buscar;
        $resultados_busqueda->withPath('resultado-busqueda'.'?buscar='.$request->buscar);
        $name_page = 'Resultado: '.$busqueda;
        return view('busqueda',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'datos' => $resultados_busqueda, 'busqueda' => $busqueda, 'name_page' => $name_page]);
    }



}
