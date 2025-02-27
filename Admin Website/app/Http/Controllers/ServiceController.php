<?php

namespace App\Http\Controllers;

use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
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
            $data = Service::Paginate(3); 
            return view('service.index',compact('data','Admin_pic','username'));
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
        return view('service.create',compact('username','Admin_pic'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "Sname"=>"required",
            "Spic"=>"required | extensions:png,jpg,jpeg,webp"
        ]);

        $table = new Service;

        //Image code Start
        $imgName="Service_" . time() . "." . $request->Spic->extension();
        $request->Spic->move(public_path("Service"),$imgName);
        $table->Pic=$imgName;
        //Image code end
        $table->Sname=$request->Sname;
        $table->save();

        return redirect('services')->withSuccess("Service Added...");
    }

    /**
     * Display the specified resource.
     */
    public function show(Service $service)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Service $service)
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        return view('service.edit',compact('service','username','Admin_pic'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Service $service)
    {
        $request->validate([
            "Sname"=>"required",
            "Spic"=>"extensions:png,jpg,jpeg,webp"
        ]);

        $table = service::where('_id',$service->_id)->first();

        if(isset($request->Spic)){
            //Image code Start
            $imgName="Service_" . time() . "." . $request->Spic->extension();
            $request->Spic->move(public_path("Service"),$imgName);
            $table->Pic=$imgName;
            //Image code end
        }

        $table->Sname=$request->Sname;
        $table->save();

        return redirect('services')->withSuccess("Update Successfully...");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Service $service)
    {
        $service->delete();
        return redirect('services')->withSuccess("Deleted Successfully...");
    }

    public function getServiceDataApi()
    {
        $data = Service::get();
        foreach($data as $item){
            $pic=asset('Service');
            $item->Pic=asset('Service') ."/".$item->Pic;
        }
        return [ 
            "status" => true,
            "message" => "success",
            "service" => $data ];
    }
}
