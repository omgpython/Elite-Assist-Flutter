<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
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
            $data=Review::paginate(10);
            return view('review.index',compact('data','Admin_pic','username'));    
        }

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Review $review)
    {
        $review->delete();
        return redirect('reviews')->withSuccess("Deleted Successfully...");
    }
}
