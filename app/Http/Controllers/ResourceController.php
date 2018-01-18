<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller as BaseController;
use Litepie\Theme\ThemeAndViews;
use Litepie\User\Traits\RoutesAndGuards;
use Litepie\User\Traits\UserPages;
use App\Http\Response\ResourceResponse;

use Illuminate\Support\Facades\Auth;
use App;
use App\orders;
use App\orders_users;
use App\usuarios;
use App\productos;
use App\det_products;


class ResourceController extends BaseController
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
        $receiver= \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders_users.id_users_receiver',$iduser)
        ->orderBy('created_at','asc')
        ->paginate(10);

        $send = \DB::table('orders')
        ->select('orders.id','orders.title','orders.description','orders.status','orders.created_at')
        ->join('orders_users', 'orders.id', '=', 'orders_users.id_orders')
        ->where('orders_users.id_users_sender',$iduser)
        ->orderBy('created_at','asc')
        ->paginate(10);

        return $this->response->title('Dashboard')
            ->data(['menu' => 'Tablero','receiver' => $receiver, 'send' => $send])
            ->view('home')
            ->output();
    }


}
