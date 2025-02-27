<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;

class AdminProfile extends Controller
{
    public function index(){

        $uid=session()->get('id');
        $Admin_pic=session()->get('Admin_pic');
        $username=session()->get('username');
        $status=session()->get('status');

        $data = Admin::where('_id',$uid)->first();

        if(!isset($uid)){
            return redirect("/AdminLogin");
        }else{
            return view('profile.AdminProfile',compact('data','Admin_pic','username','status'));
        }
    }

    public function EditProfile(Request $request){

        $request->validate([
            "fullName"=>"required",
            "email"=>"required",
            "uname"=>"required",
            "apic"=>"extensions:png,jpg,jpeg,webp"
        ]);

        $uid=session()->get('id');

        $table = Admin::where('id',$uid)->first();

        if(isset($request->apic)){
            //Image code Start
            $imgName="Admin_" . time() . "." . $request->apic->extension();
            $request->apic->move(public_path("Admin"),$imgName);
            $table->Admin_pic=$imgName;
            //Image code end
            session()->put('Admin_pic',$imgName);
        }

        $table->fullName=$request->fullName;
        $table->email=$request->email;
        $table->username=$request->uname;

        session()->put('fullname',$request->fullName);
        session()->put('email',$request->email);
        session()->put('username',$request->uname);

        $table->save();

        return redirect()->back()->withSuccess('Profile Edited...');
    }

    public function ChangePassword(Request $request){

        $request->validate([
            "cpassword"=>"required",
            "password"=>"required",
            "cfpassword"=>"required",
        ]);

        $uid=session()->get('id');
        $pass=session()->get('password');
       
        $table = Admin::where('_id',$uid)->first();

        if($request->password == $request->cfpassword){
            if($request->password == $pass){
                return redirect()->back()->withSuccess('Current Password And New Passowrd Cannot Be Same!!!');
            }else if($request->cpassword == $pass){
                $table->password=$request->password;
                $table->save();
                session()->flush();
                return redirect('/AdminLogin')->withSuccess('Password Changed Successfully Please Login Again');
            }else{
                return redirect()->back()->withSuccess('Current Password Is wrong Please Try Again!!!');
            }
        }else{
            return redirect()->back()->withSuccess('New Password And Confirm Password Not Match please Try Again...');
        }
        
    }



}
