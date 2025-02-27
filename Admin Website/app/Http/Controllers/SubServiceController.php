<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Models\SubService;
use Illuminate\Http\Request;

class SubServiceController extends Controller
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
            $sub=Service::get();
            $Ssdata = SubService::Paginate(3); 
            return view('subservice.index',compact('Ssdata','sub','Admin_pic','username'));
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
        $data=Service::get();
        return view('subservice.create',compact('data','username','Admin_pic'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "Ssname"=>"required",
            "Sid"=>"required",
            "Sspic"=>"required | extensions:png,jpg,jpeg,webp"
        ]);

        $table = new SubService;

        //Image code Start
        $imgName="SubService_" . time() . "." . $request->Sspic->extension();
        $request->Sspic->move(public_path("SubService"),$imgName);
        $table->SsPic=$imgName;
        //Image code end

        $table->SsName=$request->Ssname;
        $table->Sid=$request->Sid;
        $table->save();

        return redirect('subservices')->withSuccess("Sub-Service Added...");
    }

    /**
     * Display the specified resource.
     */
    public function show(SubService $subService)
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
        $data=Service::get();
        $subService=SubService::where('_id',$id)->first();
        return view('subservice.edit',compact('subService','data','username','Admin_pic'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            "Ssname"=>"required",
            "Sid"=>"required",
            "Sspic"=>"extensions:png,jpg,jpeg,webp"
        ]);

        $table = SubService::where('_id',$id)->first();

        if(isset($request->Sspic)){
            //Image code Start
            $imgName="SubService_" . time() . "." . $request->Sspic->extension();
            $request->Sspic->move(public_path("SubService"),$imgName);
            $table->SsPic=$imgName;
            //Image code end
        }

        $table->SsName=$request->Ssname;
        $table->Sid=$request->Sid;
        $table->save();

        return redirect('subservices')->withSuccess("Update Successfully...");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {

        $table=SubService::where('_id',$id)->first();
        $table->delete();
        return redirect('subservices')->withSuccess("Deleted Successfully...");
    }

    public function getServiceDataApi()
    {
        $data = SubService::get();
        foreach($data as $item){
            $item->SsPic=asset('SubService') ."/".$item->SsPic;
        }
        return [ 
            "status" => true,
            "message" => "success",
            "service" => $data ];
    }

    public function getSubService(Request $request) {

        $data=SubService::where("Sid",$request->id)->get();
        foreach($data as $item){
            $pic=asset('SubService');
            $item->SsPic=asset('SubService') ."/".$item->SsPic;
        }
        
        return [ 
            "status" => true,
            "message" => "success",
            "service" => $data ];
        
    }
}
