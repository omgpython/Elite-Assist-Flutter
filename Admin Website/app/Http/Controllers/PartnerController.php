<?php

namespace App\Http\Controllers;

use App\Models\order;
use App\Models\Partner;
use App\Models\Person;
use App\Models\SubService;
use Illuminate\Http\Request;

class PartnerController extends Controller
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
            $Sub=SubService::get();
            $data=Partner::paginate(10);
            return view('partner.index',compact('data','Sub','Admin_pic','username'));
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
        $data=SubService::get();
        return view('partner.create',compact('data','username','Admin_pic'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "pname"=>"required",
            "mobno"=>"required",
            "email"=>"required",
            "aadhar"=>"required",
            "pid"=>"required",
            "ppic"=>"required | extensions:png,jpg,jpeg,webp",
            "apic"=>"required | extensions:png,jpg,jpeg,webp"
        ]);
        $table=new Partner();
        //Image code Start
        $imgName="partners" . time() . "." . $request->ppic->extension();
        $request->ppic->move(public_path("partners"),$imgName);
        $table->partner_pic=$imgName;
        //Image code end

        //AAdhar Image code Start
        $AimgName="partners_aadhar" . time() . "." . $request->apic->extension();
        $request->apic->move(public_path("partners_Aadhar_pic"),$AimgName);
        $table->aadhar_pic=$AimgName;
        //AAdhar Image code end

        $table->partner_name=$request->pname;
        $table->mobile_no=$request->mobno;
        $table->email_id=$request->email;
        $table->aadhar_no=$request->aadhar;
        $table->product_id=$request->pid;
        $table->save();
        return redirect('partnerss')->withSuccess("Inserted Successfully");
    }

    /**
     * Display the specified resource.
     */
    public function show(Partner $partner)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        $data=SubService::get();
        $partners=Partner::where('_id',$id)->first();
        return view('partner.edit',compact('partners','data','username','Admin_pic'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,$id)
    {
        $request->validate([
            "pname"=>"required",
            "mobno"=>"required",
            "email"=>"required",
            "aadhar"=>"required",
            "pid"=>"required",
            "ppic"=>" extensions:png,jpg,jpeg,webp"
        ]);
        $table=Partner::where('_id',$id)->first();

        if(isset($request->ppic)){
            //Image code Start
            $imgName="partners" . time() . "." . $request->ppic->extension();
            $request->ppic->move(public_path("partners"),$imgName);
            $table->partner_pic=$imgName;
            //Image code end
        }
        if(isset($request->apic)){
            //AAdhar Image code Start
            $AimgName="partners_aadhar" . time() . "." . $request->apic->extension();
            $request->apic->move(public_path("partners_Aadhar_pic"),$AimgName);
            $table->aadhar_pic=$AimgName;
            //AAdhar Image code end
        }

        $table->partner_name=$request->pname;
        $table->mobile_no=$request->mobno;
        $table->email_id=$request->email;
        $table->aadhar_no=$request->aadhar;
        $table->product_id=$request->pid;
        $table->save();
        return redirect('partnerss')->withSuccess("Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $table=Partner::where('_id',$id)->first();
        $table->delete();
        return redirect('partnerss')->withSuccess("Deleted Successfully...");
    }

    public function getPartnerDataApi(Request $request)
    {
        if(isset($request->mobile_no)){
            $data = Partner::where("mobile_no",$request->mobile_no)->first();   
            
            if(isset($data)) { 
                $data->partner_pic=asset('partners')."/".$data->partner_pic;
                return [ 
                    "status" => true,
                    "message" => "success",
                    "partner" => $data 
                ];
            } else {
                return [ 
                    "status" => false,
                    "message" => "Partner Not Found",
                    "partner" => null
                ];
            }

        }else{
            return [ 
                "status" => false,
                "message" => "Insufficient Perameters!!",
                "partner" => null 
            ];
        }
    }

    public function getOrders(Request $request) {
        if(isset($request->id)
            && isset($request->status)
        ) {
            $data = order::where("partner_id",$request->id)
                ->where("status",(int) $request->status)
                ->get();
            if(isset($data)) {
                foreach($data as $item){
                    $item->ppic = asset('product') ."/".$item->ppic;
                }
                return [
                    "status"=>true,
                    "message"=>"getting data...",
                    "order"=>$data
                ];
            } else {
                return [
                    "status"=>false,
                    "message"=>"No Order Found",
                    "order"=>null
                ]; 
            }
        } else {
            return [
                "status"=>false,
                "message"=>"Insufficient Parameters!!",
                "order"=>null
            ];
        }
    }
}
