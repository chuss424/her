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

class CartController extends Controller
{

	public function __construct()
	{
		if (!\Session::has('cart')) \Session::put('cart', array());
	}

    // show cart
    public function show()
    {
    	$carrito = \Session::get('cart');
    	//return \Session::get('cart');
    	$productos = productos::orderBy('name','asc')->get();
        $det_productos = det_products::orderBy('id','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Carrito';
        if (Auth::check())
        {
        $iduser = Auth::user()->id;
        $send = \DB::table('orders')
            ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
            ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
            ->where('orders_users.id_users_sender',$iduser)
            ->paginate(15);
        return view('carrito',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'send' => $send, 'carrito' => $carrito, 'det_productos' => $det_productos, 'name_page' => $name_page]);
        
        }
        return view('carrito',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'carrito' => $carrito, 'det_productos' => $det_productos, 'name_page' => $name_page]);
    }

    // add item

    public function add(det_products $product, $quantity)
    {
    	$cart = \Session::get('cart');
    	$product->quantity = $quantity;
    	$cart[$product->id] = $product;
    	\Session::put('cart', $cart);
        echo json_encode(['mensaje' => 'exito']);
    	//return redirect()->route('cart-show');
    }

    //delete item

    public function delete(det_products $product)
    {
    	$cart = \Session::get('cart');
    	unset($cart[$product->id]);
    	\Session::put('cart', $cart);
    	return redirect()->route('cart-show');
    }

    //update item

    public function update(det_products $product, $quantity)
    {
    	$cart = \Session::get('cart');
    	$cart[$product->id]->quantity = $quantity;
    	\Session::put('cart', $cart);
    	return redirect()->route('cart-show');
    }

    //trash cart

    public function trash()
    {
    	\Session::forget('cart');
    	return redirect()->route('cart-show');
    }

    public function orderDetail()
    {
    	if (Auth::check())
        {
       	$carrito = \Session::get('cart');
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Detalle del pedido';
        return view('pedido',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page, 'carrito' => $carrito]);
    
        }
    	return Redirect('/cliente/iniciar_sesion');
    }

    public function pedidoDetail($id)
    {
        if (Auth::check())
        {
         
        $productos = productos::orderBy('name','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $tipo = type_pro::orderBy('name','asc')->get();
        $active = '';
        $name_page = 'Detalle del pedido';
        $pedido = orders::find($id);
        $det_pedido = orders_details::where('id_order',$id)->get();
        $det_productos = det_products::orderBy('id','asc')->get();
        return view('pedido_confirmado',['productos'=>$productos, 'categoria'=>$categoria, 'tipo'=>$tipo, 'active' => $active, 'name_page' => $name_page, 'pedido' => $pedido, 'det_pedido' => $det_pedido, 'det_productos' => $det_productos]);
    
        }
        return Redirect('/cliente/iniciar_sesion');
    }

    //total
}
