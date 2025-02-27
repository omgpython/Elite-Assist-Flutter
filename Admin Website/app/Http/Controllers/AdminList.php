<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;

class AdminList extends Controller
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
            if($status == 1){
                $Admins_Lists=Admin::where('status','0')->paginate(5);
                return view('AdminsList',compact('Admins_Lists','Admin_pic','username'));
            }else {
                session()->flush();
                return redirect()->back()->withSuccess('You Are Not Allowed');
            }
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

        if(!isset($uid)){
            return redirect("/AdminLogin");
        }else{
            if($status == 1){
                return view("register",compact('username','Admin_pic'));
            }else {
                session()->flush();
                return redirect()->back()->withSuccess('You Are Not Allowed');
            }
        }
        
    
    
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "fname" => "required",
            "email" => "required",
            "username"=>"required",
            "password"=>"required",
            "apic" => "required | extensions:png,jpg,jpeg,webp"
        ]);
        $table= new Admin;

        //Image code Start
        $imgName="Admin_" . time() . "." . $request->apic->extension();
        $request->apic->move(public_path("Admin"),$imgName);
        $table->Admin_pic=$imgName;
        //Image code end

        $table->fullname=$request->fname;
        $table->email=$request->email;
        $table->username=$request->username;
        $table->password=$request->password;
        $table->save();
        return redirect('AdminsLists')->withSuccess('Admin Created');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $table=Admin::where('_id',$id)->first();
        $table->delete();
        return redirect('AdminsLists')->withSuccess("Admin Deleted Successfully...");
    }
}
