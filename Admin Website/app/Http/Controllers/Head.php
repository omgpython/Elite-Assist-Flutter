<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Head extends Controller
{
    public function index(){
        $uid=session()->get('id');
        $username=session()->get('username');
        $status=session()->get('status');
        $Admin_pic=session()->get('Admin_pic');
        return view('Heade',compact('Admin_pic','username'));
    }
}
