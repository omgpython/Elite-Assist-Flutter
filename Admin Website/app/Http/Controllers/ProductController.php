<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\SubService;
use Illuminate\Http\Request;

class ProductController extends Controller
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
            $sub=SubService::get();
            $data=Product::paginate(5);
            return view('product.index',compact('data','sub','Admin_pic','username'));
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
        return view('product.create',compact('data','Admin_pic','username'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "pname"=>"required",
            "price"=>"required",
            "details"=>"required",
            "time"=>"required",
            "pic1"=>"required | extensions:png,jpg,jpeg,webp",
            "pic2"=>"required | extensions:png,jpg,jpeg,webp",
            "video"=>"required | extensions:mp4,mov",
            "gender"=>"required",
            "subservice_id"=>"required",
        ]);

        $table = new Product;

        //Image1 code Start
        $imgName1="Product_pic_1" . time() . "." . $request->pic1->extension();
        $request->pic1->move(public_path("product"),$imgName1);
        $table->product_pic1=$imgName1;
        //Image1 code end

        //Image1 code Start
        $imgName2="Product_pic_2" . time() . "." . $request->pic2->extension();
        $request->pic2->move(public_path("product"),$imgName2);
        $table->product_pic2=$imgName2;
        //Image1 code end

        //video code Start
        $VideoName="Product_Video_" . time() . "." . $request->video->extension();
        $request->video->move(public_path("product_video"),$VideoName);
        $table->product_vid=$VideoName;
        //Image1 code end

        $table->product_name=$request->pname;
        $table->price=$request->price;
        $table->details=$request->details;
        $table->time=$request->time;
        $table->gender=$request->gender;
        $table->SubService_id=$request->subservice_id;
        $table->save();

        return redirect('products')->withSuccess("Product Added...");
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
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
        $products=Product::where('_id',$id)->first();
        // dd($products);
        return view('product.edit',compact('products','data','username','Admin_pic'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,$id)
    {
        $request->validate([
            "pname"=>"required",
            "price"=>"required",
            "details"=>"required",
            "time"=>"required",
            "pic1"=>"extensions:png,jpg,jpeg,webp",
            "pic2"=>"extensions:png,jpg,jpeg,webp",
            "video"=>"extensions:mp4,mov",
            "gender"=>"required",
            "subservice_id"=>"required",
        ]);

        $table = Product::where('_id',$id)->first();

        if(isset($request->pic1)){
            //Image1 code Start
            $imgName1="Product_pic_1" . time() . "." . $request->pic1->extension();
            $request->pic1->move(public_path("product"),$imgName1);
            $table->product_pic1=$imgName1;
            //Image1 code end
        }

        if(isset($request->pic2)){
            //Image2 code Start
            $imgName2="Product_pic_2" . time() . "." . $request->pic2->extension();
            $request->pic2->move(public_path("product"),$imgName2);
            $table->product_pic2=$imgName2;
            //Image2 code end
        }

        if(isset($request->video)){
            //video code Start
            $VideoName="Product_Video_" . time() . "." . $request->video->extension();
            $request->video->move(public_path("product_video"),$VideoName);
            $table->product_vid=$VideoName;
            //Image1 code end
        }

        $table->product_name=$request->pname;
        $table->price=$request->price;
        $table->details=$request->details;
        $table->time=$request->time;
        $table->gender=$request->gender;
        $table->SubService_id=$request->subservice_id;
        $table->save();

        return redirect('products')->withSuccess("Update Successfully...");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $table=Product::where('_id',$id)->first();
        $table->delete();
        return redirect('products')->withSuccess("Deleted Successfully...");
    }

    public function getProductDataApi()
    {
        $data = Product::where('gender','NoGender')->get();
        foreach($data as $item){
            $item->product_pic1=asset('product') ."/".$item->product_pic1;
        }

        foreach($data as $item){
            $item->product_pic2=asset('product') ."/".$item->product_pic2;
        }

        foreach($data as $item){
            $item->product_vid=asset('product_video') ."/".$item->product_vid;
        }
        
        return [ 
            "status" => true,
            "message" => "success",
            "product" => $data ];
    }

    public function getMenProductDataApi()
    {
        $data = Product::where('gender','male')->get();
        foreach($data as $item){
            $item->product_pic1=asset('product') ."/".$item->product_pic1;
        }

        foreach($data as $item){
            $item->product_pic2=asset('product') ."/".$item->product_pic2;
        }

        foreach($data as $item){
            $item->product_vid=asset('product_video') ."/".$item->product_vid;
        }
        
        return [ 
            "status" => true,
            "message" => "success",
            "product" => $data ];
    }

    public function getWomenProductDataApi()
    {
        $data = Product::where('gender','female')->get();
        foreach($data as $item){
            $item->product_pic1=asset('product') ."/".$item->product_pic1;
        }

        foreach($data as $item){
            $item->product_pic2=asset('product') ."/".$item->product_pic2;
        }

        foreach($data as $item){
            $item->product_vid=asset('product_video') ."/".$item->product_vid;
        }
        
        return [ 
            "status" => true,
            "message" => "success",
            "product" => $data ];
    }

    public function getProductFromSubService(Request $request) {

        $data=Product::where("SubService_id",$request->id)->get();
        foreach($data as $item){
            $pic=asset('product');
            $item->product_pic1=asset('product') ."/".$item->product_pic1;
        }

        foreach($data as $item){
            $pic=asset('product');
            $item->product_pic2=asset('product') ."/".$item->product_pic2;
        }

        foreach($data as $item){
            $pic=asset('product_video');
            $item->product_vid=asset('product_video') ."/".$item->product_vid;
        }

        return [ 
            "status" => true,
            "message" => "success",
            "product" => $data ];
        
    }

    public function getRelatedProduct(Request $request) {
        if(isset($request->cat_id) &&
        isset($request->prod_id)) {
            $data = Product::where("SubService_id",$request->cat_id)
                ->where("_id","!=",$request->prod_id)
                ->get();
            
            foreach($data as $item){
                $item->product_pic1=asset('product') ."/".$item->product_pic1;
            }
    
            foreach($data as $item){
                $item->product_pic2=asset('product') ."/".$item->product_pic2;
            }
    
            foreach($data as $item){
                $item->product_vid=asset('product_video') ."/".$item->product_vid;
            }
    
            return [ 
                "status" => true,
                "message" => "success",
                "product" => $data 
            ];    

        } else {
            return [
                "status" => false,
                "message" => "Insufficient Parametrs",
                "product" => null
            ];
        }
    }

}
