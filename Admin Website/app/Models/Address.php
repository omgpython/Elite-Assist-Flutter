<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class Address extends Model
{
    use HasFactory;
    protected $connection="mongodb";
    protected $collection="addresses";

}
