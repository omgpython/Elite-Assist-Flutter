<?php

namespace App\Http\Controllers;

use App\Models\Address;
use Illuminate\Http\Request;

class AddressController extends Controller
{
    //

    public function getUserAddress() {
        $data = Address::paginate(5);
        return view('user.address',compact('data'));
    }

    public function  getAddress(Request $request) {
        if(isset($request->uid)) {
            $data=Address::where('uid',$request->uid)->get();
            if(isset($data)){
                return ['status'=>true,'msg'=>'getting...','address'=>$data];

            }else{
                return ['status'=>false,'msg'=>'not getting...','address'=>$data];
            }    
        } else {
            return ['status'=>false,'msg'=>'not getting...','address'=>null];

        }
        
    }

    public function addAddress(Request $request){
        if(isset($request->houseno)
        && isset($request->street)
        && isset($request->landmark)
        && isset($request->area)
        && isset($request->city)
        && isset($request->state)
        && isset($request->pincode)
        && isset($request->type)
        && isset($request->uid)){
            $table=new Address();
            $table->houseno=$request->houseno;
            $table->street=$request->street;
            $table->landmark=$request->landmark;
            $table->area=$request->area;
            $table->city=$request->city;
            $table->state=$request->state;
            $table->pincode=$request->pincode;
            $table->type=$request->type;
            $table->uid=$request->uid;
            $table->save();
    
            return [
                "status"=>true,
                "msg"=>"success",
                "address"=>array($table)
            ];
        
        } else {
            return [
                "status"=>false,
                "msg"=>"Insufficient Parameters",
                "address"=>null
            ];
        }
    }
}
