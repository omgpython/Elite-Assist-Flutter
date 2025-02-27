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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('uid');
            $table->integer('pid');
            $table->string('pname');
            $table->string('ppic');
            $table->decimal('amount');
            $table->decimal('total_amount');
            $table->integer('status')->default(0);
            $table->string('date',200);
            $table->string('time',200);
            $table->string('address')->nullable();
            $table->integer('payment_type')->default(1);
            $table->integer("is_aasign")->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
