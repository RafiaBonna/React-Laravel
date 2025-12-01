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
        Schema::table('users', function (Blueprint $table) {
            // api_token কলামটি যোগ করা হলো। এটি nullable এবং unique হবে।
            $table->string('api_token', 60)->unique()->nullable()->after('password');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // roll back করলে কলামটি বাদ দেওয়া হবে।
            $table->dropColumn('api_token');
        });
    }
};