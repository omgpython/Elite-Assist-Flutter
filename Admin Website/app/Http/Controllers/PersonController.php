<?php

namespace App\Http\Controllers;

use App\Models\Person;
use Illuminate\Http\Request;

class PersonController extends Controller
{

public function checkEmail(Request $request){
    if(!isset($request->email)){
        return [
            "status"=>false,
            "message"=>"Not sufficient Parameter",
            "person"=>null
        ];
    }else{
        $data=Person::where("email",$request->email)->first();
        if($data!=null){
            return [
                "status"=>false,
                "message"=>"Already Exist",
                "person"=>true
            ];
        }else{
            return [
                "status"=>true,
                "message"=>"Done",
                "person"=>false
            ];
        }
    }
}

   public function register_user(Request $request) {
    if(isset($request->username) && 
        isset($request->password) &&
        isset($request->email) &&
        isset($request->phone)){

            $data = Person::where("email",$request->email)->first();

            if(isset($data)) {
                return [
                    "status"=>false,
                    "message"=>"User Already Exists",
                    "person"=>$data
                ];
            } else {
                $table=new Person();
                $table->username=$request->username;
                $table->email=$request->email;
                $table->password=md5($request->password);
                $table->phone=$request->phone;

                $table->save();

                return [
                    "status"=>true,
                    "message"=>"Registered Successfully!!",
                    "person"=>$table
                ];
            }
            
        }else{
            return [
                "status"=>false,
                "message"=>"Insufficient Parameter ",
                "person"=>null
            ];
        }
   }


   public function login_api(Request $request) {
    if(isset($request->email)
    && isset($request->password)){
        $table=Person::where('email',$request->email)
        ->where('password',md5($request->password))->first();


        if(isset($table)){
            return [
                "status"=>true,
                "message"=>"Login Successfully!!!",
                "person"=>$table
            ];
        }else{
            return [
                "status"=>false,
                "message"=>"username or password incorrect",
                "person"=>null
            ];
        }

    }else{
        return [
            "status"=>false,
            "message"=>"Insufficient Parameter",
            "person"=>null
        ];
    }
    }

    public function editProfile(Request $request) {
        if(isset($request->username) &&
        isset($request->phone) &&
        isset($request->id) 
        ){
            
            $id=$request->id;
            $phone=$request->phone;
            $username=$request->username;    
    
            $data=Person::whereId($id)->first();
            
            $data->phone=$phone;
            $data->username=$username;
            $data->save();

            return [
                "status"=>true,
                "message"=>"Updated Successfully!!",
                "person"=>$data
            ];
    
        }else{
            return [
                "status"=>false,
                "message"=>"Insufficient Parameter ",
                "person"=>null
            ];
        }
    }

    
}
