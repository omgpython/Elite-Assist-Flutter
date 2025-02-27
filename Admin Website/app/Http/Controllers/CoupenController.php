<?php

namespace App\Http\Controllers;

use App\Models\Coupen;
use Illuminate\Http\Request;

class CoupenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        if(!isset($uid)){
            return redirect("/AdminLogin");
        }else{
            $data=Coupen::paginate(10);
            return view('coupen.index',compact('data','Admin_pic','username'));
        }

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        return view('coupen.create',compact('username','Admin_pic'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'ccode'=>'required',
            'cdescription'=>'required',
            'cdiscount'=>'required',
        ]);
        $table=new Coupen();
         
        //Image code Start
        $imgName="Coupen_" . time() . "." . $request->Cpic->extension();
        $request->Cpic->move(public_path("Coupen"),$imgName);
        $table->coupen_img=$imgName;
        //Image code end

        $table->coupen_code=$request->ccode;
        $table->coupen_descreption=$request->cdescription;
        $table->coupen_discount=$request->cdiscount;
        if(strcmp($request->status,"on")==0){
            $table->status=true;
        }
        else{
            $table->status=false;
        }
        $table->save();
        return redirect('coupens')->withSuccess("Inserted Successfully");
    }

    /**
     * Display the specified resource.
     */
    public function show(Coupen $coupen)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Coupen $coupen)
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        return view('coupen.edit',compact('coupen','username','Admin_pic'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Coupen $coupen)
    {
        $request->validate([
            'ccode'=>'required',
            'cdescription'=>'required',
            'cdiscount'=>'required',
        ]);

        $table=Coupen::where('_id',$coupen->_id)->first();

        if(isset($request->Cpic)){
            //Image code Start
            $imgName="Coupen_" . time() . "." . $request->Cpic->extension();
            $request->Cpic->move(public_path("Coupen"),$imgName);
            $table->coupen_img=$imgName;
            //Image code end
        }

        $table->coupen_code=$request->ccode;
        $table->coupen_descreption=$request->cdescription;
        $table->coupen_discount=$request->cdiscount;
        if(strcmp($request->status,"on")==0){
            $table->status=true;
        }
        else{
            $table->status=false;
        }
        $table->save();
        return redirect('coupens')->withSuccess("Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Coupen $coupen)
    {
        $coupen->delete();
        return redirect('coupens')->withSuccess("Deleted Successfully...");
    }

    public function getCoupenDataApi()
    {
        $data = Coupen::where('status',true)->get();
        foreach($data as $item){
            $pic=asset('Coupen');
            $item->coupen_img=asset('Coupen') ."/".$item->coupen_img;
        }
        return [ 
            "status" => true,
            "message" => "success",
            "coupen" => $data ];
    }

    public function getCouponFromCode(Request $request) {
        $ccode=$request->ccode;
        if(isset($ccode)){
    
            $data=Coupen::where('coupen_code',$ccode)->first();
            if(isset($data)) {
                return [
                    "status" => true,
                    "message" => "Coupon Applyed",
                    "coupen" => $data
                ];
            } else {
                return [
                    "status" => false,
                    "message" => "Coupon Not Found",
                    "coupen" => null
                ];
            }
            
    
        }else{
            return [
                "status" => false,
                "message" => "Insufficient Parameters!!",
                "coupen" => null
           ];
        }
    
    }
}
