<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class UserAddress extends Model
{
    use HasFactory;
    protected $connection="mongodb";
    protected $collection="user_addresses";
}
