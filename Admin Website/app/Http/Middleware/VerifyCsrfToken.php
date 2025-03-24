<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        "/register_user",
        "/api/getpartner",
        "/login",
        "/api/addOrder",
        "/api/makePayment",
        "/api/getOrders",
        "/api/getSubService",
        "/api/getProductFromSubService",
        "/api/addaddress",
        "/get/partner/booking",
        "/PartnerOrders",
        "/completed/job",
        "/job/start",
        '/job/end','/countOfCart',
        '/get/address',
        '/api/getaddress',
        '/api/edituser',
        '/getorder/pending/user',
        '/getorder/completed/user',
        '/getorder/cancel/user',
        '/api/applycoupon',
        '/checkemail',
        '/api/relatedproduct',
        '/api/editaddress',
        '/api/deleteaddress',
        '/api/findaddress',
        '/api/orders',
        'api/orders/finish'
    ];
}
