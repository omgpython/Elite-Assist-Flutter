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
        Schema::create('coupens', function (Blueprint $table) {
            $table->id();
            $table->string('coupen_code',50);
            $table->string('coupen_descreption',50);
            $table->string('coupen_discount',50);
            $table->string('coupen_img');
            $table->boolean('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('coupens');
    }
};
