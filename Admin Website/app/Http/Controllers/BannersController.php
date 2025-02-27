<?php

namespace App\Http\Controllers;

use App\Models\Banners;
use Illuminate\Http\Request;

class BannersController extends Controller
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
            $banners=Banners::latest()->paginate(2);
            return view('banner.index',compact('banners','Admin_pic','username'));
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
        return view('banner.create',compact('uid','username','Admin_pic'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'Btitle'=>'required',
            'Bpic'=>'required | extensions:jpg,png,jpeg',
        ]);
        $table=new Banners();
        $table->btitle=$request->Btitle;
        $imgName=time()."_banner".".".$request->Bpic->extension();
        $request->Bpic->move(public_path('banner'),$imgName);
        $table->pic=$imgName;
        if(strcmp($request->status,"on")==0){
            $table->status=true;
        }
        else{
            $table->status=false;
        }
        $table->save();
        return redirect('banners')->withSuccess("Inserted Successfully");
    }

    /**
     * Display the specified resource.
     */
    public function show(Banners $banner)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Banners $banner)
    {
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        return view('banner.edit',compact('banner','Admin_pic','username'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Banners $banner)
    {
        //
        $request->validate([
            'Btitle'=>'required',
            'Bpic'=>' extensions:jpg,png,jpeg',
        ]);

        $table=Banners::where('_id',$banner->_id)->first();

        $table->btitle=$request->Btitle;
        if($request->Bpic){
        $imgName=time()."_banner".".".$request->Bpic->extension();
        $request->Bpic->move(public_path('banner'),$imgName);
        $table->pic=$imgName;
        }
        if(strcmp($request->status,"on")==0){
            $table->status=true;
        }
        else{
            $table->status=false;
        }
        $table->save();
        return redirect('banners')->withSuccess("Update Successfully");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Banners $banner)
    {
        $banner->delete();
        return redirect('banners')->withSuccess("Deleted Successfully...");
    }

    public function getBannerDataApi()
    {
        $data = Banners::where('status',true)->get();
        foreach ($data as $item) {
            $pic=asset('banner');
            $item->pic=asset('banner') ."/".$item->pic;

        }
        
        return [ 
            "status" => true,
            "message" => "success",
            "banner" => $data ];
    }
}