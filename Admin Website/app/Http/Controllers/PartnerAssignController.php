<?php

namespace App\Http\Controllers;

use App\Models\order;
use App\Models\PartnerBooking;
use Illuminate\Http\Request;

class PartnerAssignController extends Controller
{
    public function AssignPartners(Request $request){


        $request->validate([
            "partner_id"=>"required",
        ]);
 
        $table = new PartnerBooking;
        $table->oid=$request->_id;
        $table->pid=$request->pid;
        $table->cid=$request->uid;
        $table->part_id=$request->partner_id;
        $table->address=$request->address;
        $table->status=$request->status;
        $table->price=$request->price;
        $table->save();

        $table=order::whereId($request->_id)->first();
        $table->is_aasign="1";
        $table->save();
        
        return redirect('orders')->withSuccess("Assigned Successfully");
    }

    public function PartnerOrdersapi()
    {
        $data = PartnerBooking::get();

        return [ 
            "status" => true,
            "message" => "success",
            "PartnerBooking" => $data ];
    }
}
