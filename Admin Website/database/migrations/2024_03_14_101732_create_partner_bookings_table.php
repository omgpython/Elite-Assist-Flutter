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
        Schema::create('partner_bookings', function (Blueprint $table) {
            $table->id();
            $table->integer("pid");
            $table->integer("cid");
            $table->integer("oid");
            $table->integer("part_id");
            $table->string("address")->nullable();
            $table->string("status")->default("0");
            $table->decimal("price");
            $table->integer('payment_type')->default(1);
            $table->string("job_start")->nullable();
            $table->string("job_end")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('partner_bookings');
    }
};
