<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('product_name',50);
            $table->string('price',50);
            $table->string('details',5000);
            $table->string('time',50);
            $table->string('product_pic1');
            $table->string('product_pic2');
            $table->string('product_vid');
            $table->string('gender',50);
            $table->integer('SubService_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
