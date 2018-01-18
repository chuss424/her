<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as BaseController;
use Illuminate\Support\Facades\Storage;
use Litepie\Theme\ThemeAndViews;
use Litepie\User\Traits\RoutesAndGuards;
use Litepie\User\Traits\UserPages;
use App\Http\Response\ResourceResponse;

use Illuminate\Support\Facades\Auth;
use App;
use App\productos;
use App\det_products;
use App\categoria;
use App\categoria_productos;
use App\type_pro;

class ProductsController extends Controller
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
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }

        $productos = productos::orderBy('name','asc')->paginate(15);
        $categoria = categoria::orderBy('name','asc')->get();
        return $this->response->title('Dashboard')
            ->view('products.products')
            ->data(['datos' => $productos, 'menu' => 'Productos','categoria' => $categoria])
            ->output();
    }

    public function vista_crear()
    {
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }

        $tipo = type_pro::orderBy('id','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        return $this->response->title('Dashboard')
            ->view('products.crear')
            ->data(['menu' => 'Productos','categoria' => $categoria, 'tipo' => $tipo])
            ->output();
    }

    public function crear(request $request)
    {
        //dd($request->all());
        $separar = explode(',',$request->input('categoria'));
        $categoria = $separar[0];
        $tipo = $separar[1];

        $banner=$this->subir_imagen('foto',"/pluton/images/productos/","",$request);
        $producto = New productos;
        $producto->name = $request->input('nombre');
        $producto->marca = $request->input('marca');
        $producto->picture = $banner;
        $producto->type_pro = $tipo;
        $producto->save();

        $codigo=$request->input('cod'); 
        $descripcion=$request->input('descripcion');
        $unidad=$request->input('unidad');
        $color=$request->input('color');

        foreach ($codigo as $key =>$value ) {
            if ($value!=null) {
                $detalle_pro = New det_products;
                $detalle_pro->cod = $codigo[$key];
                $detalle_pro->description = $descripcion[$key];
                $detalle_pro->unidad = $unidad[$key];
                $detalle_pro->color = $color[$key];
                $detalle_pro->save();
                $producto->det_products()->attach($detalle_pro); 
            }
        }

        $producto->categoria()->attach($categoria);
        

        return redirect("/admin/productos");

    }

    public function vista_modificar($id)
    {
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }

        $tipo = type_pro::orderBy('id','asc')->get();
        $categoria = categoria::orderBy('id','asc')->get();
        $producto = productos::where('id',$id)->first();
        return $this->response->title('Dashboard')
            ->view('products.modificar')
            ->data(['datos' => $producto,'menu' => 'Productos','categoria' => $categoria, 'tipo' => $tipo])
            ->output();
    }

    public function modificar_guardar(request $request)
    {
        //dd($request->all());
        $separar = explode(',',$request->input('categoria'));
        $categoria = $separar[0];
        $tipo = $separar[1];

        $producto=productos::find($request->input('id'));
        $producto->name = $request->input('nombre');
        $producto->marca = $request->input('marca');
        $producto->picture = $this->subir_imagen('foto',"/pluton/images/productos/",$producto->picture,$request);
        $producto->type_pro = $tipo;
        $producto->save();

        $codigo=$request->input('cod'); 
        $descripcion=$request->input('descripcion');
        $unidad=$request->input('unidad');
        $color=$request->input('color');

        foreach ($codigo as $key =>$value ) {
            if ($value!=null) {
                $detalle_pro = New det_products;
                $detalle_pro->cod = $codigo[$key];
                $detalle_pro->description = $descripcion[$key];
                $detalle_pro->unidad = $unidad[$key];
                $detalle_pro->color = $color[$key];
                $detalle_pro->save();
                $producto->det_products()->attach($detalle_pro); 
            }
        }
        if(!empty($request->input('id_ant'))){
            $id_ant=$request->input('id_ant'); 
            $codigo_ant=$request->input('cod_ant'); 
            $descripcion_ant=$request->input('descripcion_ant');
            $unidad_ant=$request->input('unidad_ant');
            $color_ant=$request->input('color_ant');
    
            foreach ($codigo_ant as $key =>$value ) {
                if ($value!=null) {
                    $detalle_pro_ant = det_products::find($id_ant[$key]);
                    $detalle_pro_ant->cod = $codigo_ant[$key];
                    $detalle_pro_ant->description = $descripcion_ant[$key];
                    $detalle_pro_ant->unidad = $unidad_ant[$key];
                    $detalle_pro_ant->color = $color_ant[$key];
                    $detalle_pro_ant->save(); 
                }
            }
        }

        $producto->categoria()->sync($categoria);

        return redirect("/admin/productos");

    }


    public function subir_imagen($name_input_imagen,$direccion,$imagen_vieja,$request){

        $key = "";
        $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        //aquí podemos incluir incluso caracteres especiales pero cuidado con las ‘ y “ y algunos otros
        $length = 20;
        $max = strlen($characters) - 1;
        for ($i=0;$i<$length;$i++)
        {
            $key .= substr($characters, rand(0, $max), 1);
        }
    
        if ($request->hasFile($name_input_imagen)){       
                
            $extension=$request->file($name_input_imagen)->getClientOriginalExtension();

            if ($extension!='png' && $extension!='jpg' && $extension!='jpeg' ) {

                return back()->withInput()->with('status', 'nose permiten archivos .'.$extension);
                  
            }else{
                if($imagen_vieja!=""){
                    Storage::delete($imagen_vieja);
                }            
                $nombre_image=$direccion.str_slug($key).".".$extension;                
                Storage::disk('local')->put($nombre_image,  \File::get($request->file($name_input_imagen)));               
            }                  
        }
        else{ 
           $nombre_image=$imagen_vieja;           
        }
        return $nombre_image;
    }

    public function order($order)
    {
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }

        switch ($order) {
         case 'modificado':
            $productos=productos::orderBy('updated_at','des')->paginate(15);
         break;
         case 'buscar':
           $search=$_GET['search'];
           $productos=productos::where('name','like',"%$search%")->paginate(15);
         break;
         case 'categoria':
           $search=$_GET['id'];
           //$productos = productos::orderBy('name','asc')->get();
           $categoria = categoria::find($search);
           $productos= \DB::table('products')
            ->join('categoria_productos', 'products.id', '=', 'categoria_productos.productos_id')
            ->where('categoria_productos.categoria_id',$search)
            ->paginate(15);
            foreach ($productos as $key => $value) {
                $value->categoria = [];
                $value->categoria[0] = $categoria;
                //dd($value->categoria[0]->name);
            }
         break;
          }
         $categoria = categoria::orderBy('name','asc')->get();
         return $this->response->title('Dashboard')
            ->view('products.products')
            ->data(['datos' => $productos, 'menu' => 'Productos','categoria' => $categoria])
            ->output();
    }

    public function borrar($id)
    {
      $productos=productos::find($id);
      foreach ($productos->det_products as $key => $value) {
          $det_p = det_products::find($value->id);
          $det_p->delete();
      }
      $productos->det_products()->detach();
      $productos->categoria()->detach();
      $productos->delete();
      return redirect("/admin/productos");
    }

    public function view_cat()
    {
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }
        
        $productos = categoria::orderBy('name','asc')->paginate(15);
        return $this->response->title('Dashboard')
            ->view('categorias.categoria')
            ->data(['datos' => $productos, 'menu' => 'Categoria','cat' => ''])
            ->output();
    }

    public function crear_cat(request $request)
    {
        //$banner=$this->subir_imagen('foto',"/pluton/images/productos/","",$request);
        $url = str_replace(" ", "_",$request->input('nombre'));
        $producto = New categoria;
        $producto->name = $request->input('nombre');
        $producto->url = '/'.$url;
        $producto->save();
        return redirect("/admin/categoria");

    }

    public function borrar_det($id)
    {
        $detalle= det_products::find($id);
        $detalle->products()->detach();
        $detalle->delete();
        return back()->withInput()->with('ok', 'Imagen Borrada');
    }

    public function borrar_cat($id)
    {
    	//dd($id);
      $productos=productos::orderBy('name','asc')->get();
      foreach ($productos as $key => $value) {
          if($value->categoria[0]->id == $id)
          {
            $cat = categoria::where('id',$id)->first();
            $categoria = categoria::orderBy('name','asc')->paginate(15);
            return $this->response->title('Dashboard')
                ->view('categorias.categoria')
                ->data(['datos' => $categoria, 'menu' => 'Categoria','cat' => $cat->name])
                ->output();
          }
      }
      $cat = categoria::where('id',$id)->first();
      $cat->delete();
      return redirect("/admin/categoria");
    }

    public function view_type()
    {
        if (Auth::user()->designation != 'Super usuario') {
            return redirect("/admin/usuarios/stop");
        }
        
        $productos = categoria::orderBy('id','asc')->get();
        $tipo_productos = type_pro::orderBy('id','asc')->get();
        return $this->response->title('Dashboard')
            ->view('conf.producto')
            ->data(['datos' => $productos, 'menu' => 'Configuracion','cat' => '', 'tipo' => $tipo_productos])
            ->output();
    }

    public function crear_type(request $request)
    {
        //$banner=$this->subir_imagen('foto',"/pluton/images/productos/","",$request);
        $categoria = categoria::find($request->input('categoria'));
        $minicategoria = strtolower($categoria->name);
        $url = str_replace(" ", "_",$request->input('nombre'));
        $producto = New type_pro;
        $producto->id_categoria = $request->input('categoria');
        $producto->name = $request->input('nombre');
        $producto->url = '/'.$minicategoria.'/'.$url;
        $producto->save();
        return redirect("/admin/configuracion/producto");

    }

    public function borrar_type($id)
    {
        //dd($id);
      $productos=productos::orderBy('name','asc')->get();
      foreach ($productos as $key => $value) {
          if($value->type_pro == $id)
          {
            $cat = type_pro::where('id',$id)->first();
            $categoria = categoria::orderBy('id','asc')->get();
            $tipo_productos = type_pro::orderBy('id','asc')->get();

            return $this->response->title('Dashboard')
                ->view('conf.producto')
                ->data(['datos' => $categoria, 'menu' => 'Categoria','cat' => $cat->name, 'tipo' => $tipo_productos])
                ->output();
          }
      }
      $cat = type_pro::where('id',$id)->first();
      $cat->delete();
      return redirect("/admin/configuracion/producto");
    }

}
