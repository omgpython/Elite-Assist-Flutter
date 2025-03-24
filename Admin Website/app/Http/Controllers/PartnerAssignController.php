<?php

namespace App\Http\Controllers;

use App\Models\order;
use App\Models\Partner;
use App\Models\PartnerBooking;
use Illuminate\Http\Request;

class PartnerAssignController extends Controller
{
    public function AssignPartners(Request $request){


        $request->validate([
            "partner_id"=>"required",
        ]);
 
        $table = new PartnerBooking;
        $table->oid=$request->id;
        $table->pid=$request->pid;
        $table->cid=$request->uid;
        $table->part_id=$request->partner_id;
        $table->address=$request->address;
        $table->status=$request->status;
        $table->price=$request->price;
        $table->save();

        $partner = Partner::find($request->partner_id);
        $table=order::whereId($request->id)->first();
        $table->is_aasign = true;
        $table->partner_id = $request->partner_id;
        $table->partner_name = $partner->partner_name;
        $table->partner_contact = $partner->mobile_no;
        $table->partner_pic = $partner->partner_pic;
        $table->save();
        return redirect('order')->withSuccess("Assigned Successfully");
        // return redirect('orders')->withSuccess("Assigned Successfully");
    }

    public function PartnerOrdersapi()
    {
        $data = PartnerBooking::get();

        return [ 
            "status" => true,
            "message" => "success",
            "PartnerBooking" => $data 
        ];
    }
}
