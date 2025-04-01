<?php

namespace App\Http\Controllers;

use App\Models\order;
use App\Models\Partner;
use App\Models\Person;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OrderController extends Controller
{

    public function index()
    {

        $uid = session()->get('id');
        $username = session()->get('username');
        $status = session()->get('status');
        $Admin_pic = session()->get('Admin_pic');
        if (!isset($uid)) {
            return redirect("/AdminLogin");
        } else {
            $data = order::where('is_aasign', false)->paginate(2);
            return view('orders.index', compact('data', 'Admin_pic', 'username'));
        }
    }
    public function pendingorder()
    {

        $uid = session()->get('id');
        $username = session()->get('username');
        $status = session()->get('status');
        $Admin_pic = session()->get('Admin_pic');
        if (!isset($uid)) {
            return redirect("/AdminLogin");
        } else {
            $data = order::where('is_aasign', true)->where('status', 0)->paginate(2);
            return view('orders.pandding', compact('data', 'Admin_pic', 'username'));
            // return view('orders.index',compact('data','Admin_pic','username'));
        }
    }
    public function completeordeViewmore($id)
    {
        $completedgorder = order::find($id);
        return view('orders.complete', compact('completedgorder'));
    }
    public function pendingordeViewmore($id)
    {
        $pendingorder = order::find($id);
        return view('orders.pendingorderViewmore', compact('pendingorder'));
    }

    public function completedorder()
    {
        $uid = session()->get('id');
        $username = session()->get('username');
        $status = session()->get('status');
        $Admin_pic = session()->get('Admin_pic');
        if (!isset($uid)) {
            return redirect("/AdminLogin");
        } else {
            $data = order::where('is_aasign', true)->where('status', 1)->paginate(2);
            return view('orders.compalted', compact('data', 'Admin_pic', 'username'));
            // return view('orders.index',compact('data','Admin_pic','username'));
        }
    }


    // public function addOrder(Request $request)  {
    //     if(isset($request->uid)
    //         && isset($request->pid)
    //         && isset($request->pname)
    //         && isset($request->ppic)
    //         && isset($request->amount)
    //         && isset($request->total_amount)
    //         && isset($request->date)
    //         && isset($request->time)
    //         ){

    //             $data=Order::where('uid',$request->uid)
    //             ->where('status','0')->first();

    //             if(isset($data)){

    //             }else{
    //             $table=new Order();
    //             $table->uid=$request->uid;
    //             $table->pid=$request->pid;
    //             $table->ppic=$request->ppic;
    //             $table->pname=$request->pname;
    //             $table->amount=$request->amount;
    //             $table->total_amount=$request->total_amount;
    //             $table->date=$request->date;
    //             $table->time=$request->time;
    //             $table->save();
    //             return [
    //                 "status"=>true,
    //                 "message"=>"Added to Cart!!!",
    //                 "order"=>null
    //             ];
    //         }
    //     }else{

    //         return [
    //             "status"=>false,
    //             "message"=>"Insufficient Parameter",
    //             "order"=>null
    //         ];
    //     }   
    // }

    public function getOrders(Request $request)
    {
        $data = Order::where("uid", $request->uid)->get();
        foreach ($data as $item) {
            $item->ppic = asset('product') . "/" . $item->ppic;
        }
        foreach ($data as $item) {
            $item->partner_pic = asset('partners') . "/" . $item->partner_pic;
        }
        return [
            "status" => true,
            "message" => "getting data...",
            "order" => $data
        ];
    }

    public function updateAssign($id, $pid)
    {
        $product = Product::where('_id', $pid)->get()->first();
        $sid = $product->SubService_id;
        $partner = Partner::where('product_id', $sid)->get();
        $table = order::whereId($id)->first();
        return view('partnerAssign', compact('table', 'partner'));
    }

    public function makePayment(Request $request)
    {
        if (isset($request->uid)) {
            $data = Order::where('status', '0')
                ->where('uid', $request->uid)->first();

            $data->status = 1;
            $data->payment_type = $request->payment_type;
            $data->address = $request->address;
            $data->date = $request->date;
            $data->time = $request->time;
            $data->total_amount = $request->total_amount;


            $data->save();

            return [
                'status' => true,
                'message' => "success",
                'data' => $data
            ];
        } else {
            return [
                'status' => false,
                'message' => "no data",
                'data' => null
            ];
        }
    }

    public function getCountOfCart(Request $request)
    {

        $count = Order::where('uid', $request->uid)
            ->where('status', '0')->count();
        return [
            "status" => true,
            "message" => "count",
            "count" => $count
        ];
    }

    public function addOrder(Request $request)
    {
        if (
            isset($request->uid) &&
            isset($request->pid) &&
            isset($request->amount) &&
            isset($request->gst_amt) &&
            isset($request->discount_amt) &&
            isset($request->fees) &&
            isset($request->total_amt) &&
            isset($request->coupon_code) &&
            isset($request->order_date) &&
            isset($request->order_time) &&
            isset($request->date) &&
            isset($request->time) &&
            isset($request->pay_type) &&
            isset($request->address)
        ) {

            $user = Person::find($request->uid);
            $product = Product::find($request->pid);
            $table = new order();

            $table->uid = $request->uid;
            $table->uname = $user->username;
            $table->ucontact = (string) $user->phone;
            $table->pid = $request->pid;
            $table->pname = $product->product_name;
            $table->ppic = $product->product_pic1;
            $table->amount = (int) $request->amount;
            $table->gst_amt = (int) $request->gst_amt;
            $table->discount_amt = (int) $request->discount_amt;
            $table->fees = (int) $request->fees;
            $table->total_amount = (int) $request->total_amt;
            $table->coupon_code = $request->coupon_code;
            $table->order_date = $request->order_date;
            $table->order_time = $request->order_time;
            $table->date = $request->date;
            $table->time = $request->time;
            $table->payment_type = $request->pay_type;
            $table->address = $request->address;
            $table->partner_id = "";
            $table->partner_name = "";
            $table->partner_contact = "";
            $table->partner_pic = "";
            $table->end_date = "";
            $table->end_time = "";
            $table->status = 0;
            $table->is_aasign = false;
            $table->save();

            return [
                'status' => true,
                'message' => 'Service Booked',
                'order' => $table
            ];
        } else {
            return [
                'status' => false,
                'message' => 'Insufficient Parameters!!!',
                'order' => null
            ];
        }
    }

    public function completePartnerOrder(Request $request)
    {
        if (isset($request->id)) {
            $time = Carbon::now('Asia/Kolkata')->format('h:i A');
            $date = Carbon::now('Asia/Kolkata')->format('d-m-Y');

            $table = order::where('_id', $request->id)->first();

            $table->status = 1;
            $table->end_date = $date;
            $table->end_time = $time;
            $table->save();

            return [
                'status' => true,
                'message' => 'Order Complited',
                'order' => $table
            ];
        } else {
            return [
                'status' => false,
                'message' => 'Insufficient Parameters',
                'order' => null

            ];
        }
    }
}
