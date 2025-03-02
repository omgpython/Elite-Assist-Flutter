<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Coupen;
use App\Models\order;
use App\Models\Person;
use App\Models\Product;
use App\Models\Service;
use App\Models\SubService;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Dashboard extends Controller
{
    public function index(){
       
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        $status=session()->get('status');
        if(!isset($uid)){
            return redirect("/AdminLogin");
        }else{
            $revenue=DB::table('orders')->sum('total_amount'); //where('status','!=',0)->
            
            $orders = order::latest()->get();
            $order_count = $orders->count();
    
            $service = Service::get();
            $service_count = $service->count();
    
            $subservice = SubService::get();
            $subservice_count = $subservice->count();
            
            $user = Person::latest()->get();
            $user_count = $user->count();
    
            $coupen = Coupen::get();
            $coupen_count = $coupen->count();
    
            $orders1 = order::Paginate(5);
    
            $product = Product::latest()->Paginate(5);

            $admins = Admin::get();

            $admin_count = Admin::where('status','0')->get()->count();
    
            return view('Dashboard',compact('order_count','user_count','coupen_count','orders1','product','revenue','service_count','subservice_count','username','Admin_pic','admins','status','admin_count'));
        }
  
    }
}
