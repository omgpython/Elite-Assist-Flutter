<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class LoginAdmin extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('login');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function logout()
    {
        session()->flush();
        return redirect('AdminLogin');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $admin = Admin::where('username', $request->username)->first();

        if (!isset($admin)) {
            return redirect('AdminLogin')->withSuccess('Username Not Found');
        }else{
            if ($admin->password == $request->password) {
                session()->put('id',$admin->_id);
                session()->put('fullname',$admin->fullname);
                session()->put('email',$admin->email);
                session()->put('username',$admin->username);
                session()->put('status',$admin->status);
                session()->put('Admin_pic',$admin->Admin_pic);
                session()->put('password',$admin->password);

                return redirect('/Dashboards')->withSuccess('Welcome ');
            }else{
                return redirect('AdminLogin')->withSuccess('Incorrect Password');
            }
        }
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
        //
    }
}
