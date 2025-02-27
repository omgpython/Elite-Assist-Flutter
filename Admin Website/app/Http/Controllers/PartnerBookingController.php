<?php

namespace App\Http\Controllers;

use App\Models\order;
use App\Models\Partner;
use App\Models\PartnerBooking;
use App\Models\Person;
use Illuminate\Http\Request;

class PartnerBookingController extends Controller
{
    //

    public function addPartnerBooking(Request $request) {
        $table=new PartnerBooking();
        $table->pid=$request->pid;

        $table->cid=$request->cid;
        $table->address=$request->address;
        $table->part_id=$request->part_id;
        $table->status="0";

        
        $table->price=$request->price;
        $table->save();
        return back()->withSuccess('Assign Successfully');

    }

    public function getPartnerBooking(Request $request) {
        $data=PartnerBooking::where('part_id',$request->part_id)
        ->where('status','0')
        ->get();

        if(isset($data)){

            foreach($data as $item){
                $user=Person::whereId($item->cid)->first();
                $order=order::whereId($item->oid)->first();

                $item->date=$order->date;
                $item->time=$order->time;
                $item->pay_type=$order->payment_type;

                $item->pname=$order->pname;
                $item->ppic=$order->ppic;
                $item->username=$user->username;
                $item->phone=$user->phone;


            }
            return [
                "status"=>true,
                "message"=>"getting",
                "data"=>$data
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"not",
                "data"=>null
            ];
        }
    }


    public function getPartnerBookingPendingCustomer(Request $request) {
        $data=PartnerBooking::where('cid',$request->cid)
        ->where('status','0')
        ->get();

        if($data->count() > 0){

            foreach($data as $item){
                $partner=Partner::whereId($item->part_id)->first();
                $order=order::whereId($item->oid)->first();

                $item->date=$order->date;
                $item->time=$order->time;
                $item->pay_type=$order->payment_type;

                $item->pname=$order->pname;
                $item->ppic=$order->ppic;
                $item->partner_name=$partner->partner_name;
                $item->mobile_no=$partner->mobile_no;
                $item->partner_pic=asset('partners')."/".$partner->partner_pic;


            }
            return [
                "status"=>true,
                "message"=>"getting",
                "data"=>$data
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"not",
                "data"=>null
            ];
        }
    }
    public function getPartnerBookingCancelCustomer(Request $request) {
        $data=PartnerBooking::where('cid',$request->cid)
        ->where('status','2')
        ->get();

        if($data->count() > 0){

            foreach($data as $item){
                $partner=Partner::whereId($item->part_id)->first();
                $order=order::whereId($item->oid)->first();

                $item->date=$order->date;
                $item->time=$order->time;
                $item->pay_type=$order->payment_type;

                $item->pname=$order->pname;
                $item->ppic=$order->ppic;
                $item->partner_name=$partner->partner_name;
                $item->mobile_no=$partner->mobile_no;
                $item->partner_pic=asset('partners')."/".$partner->partner_pic;


            }
            return [
                "status"=>true,
                "message"=>"getting",
                "data"=>$data
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"not",
                "data"=>null
            ];
        }
    }

    public function getPartnerBookingCompletedCustomer(Request $request) {
        $data=PartnerBooking::where('cid',$request->cid)
        ->where('status','1')
        ->get();

        if($data->count() > 0){

            foreach($data as $item){
                $partner=Partner::whereId($item->part_id)->first();
                $order=order::whereId($item->oid)->first();

                $item->date=$order->date;
                $item->time=$order->time;
                $item->pay_type=$order->payment_type;

                $item->pname=$order->pname;
                $item->ppic=$order->ppic;
                $item->partner_name=$partner->partner_name;
                $item->mobile_no=$partner->mobile_no;
                $item->partner_pic=asset('partners')."/".$partner->partner_pic;


            }
            return [
                "status"=>true,
                "message"=>"getting",
                "data"=>$data
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"not",
                "data"=>null
            ];
        }
    }



    public function getPartnerBookingCompleted(Request $request) {
        $data=PartnerBooking::where('part_id',$request->part_id)
        ->where('status','1')
        ->get();

        if(isset($data)){

            foreach($data as $item){
                $user=Person::whereId($item->cid)->first();
                $order=order::whereId($item->oid)->first();

                $item->date=$order->date;
                $item->time=$order->time;
                $item->pay_type=$order->payment_type;

                $item->pname=$order->pname;
                $item->ppic=$order->ppic;
                $item->username=$user->username;
                $item->phone=$user->phone;


            }
            return [
                "status"=>true,
                "message"=>"getting",
                "data"=>$data
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"not",
                "data"=>null
            ];
        }
    }

    public function jobstart(Request $request) {
        
        if(isset($request->id)){
            $data=PartnerBooking::whereId($request->id)->first();
            $data->job_start=$request->job_start;
            $data->save();

            return [
                "status"=>true,
                "message"=>"Started Job"
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"Insufficient parameter"
            ];
        }
    }


    public function jobfinish(Request $request) {
        
        if(isset($request->id)){
            $data=PartnerBooking::whereId($request->id)->first();
            $data->job_end=$request->job_end;
            $data->status="1";

            $data->save();

            return [
                "status"=>true,
                "message"=>"Job Finish successfully!!!"
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"Insufficient parameter"
            ];
        }

    }
}


