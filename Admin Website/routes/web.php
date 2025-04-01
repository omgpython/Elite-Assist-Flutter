<?php

use App\Http\Controllers\AddressController;
use App\Http\Controllers\Admin;
use App\Http\Controllers\AdminList;
use App\Http\Controllers\AdminProfile;
use App\Http\Controllers\AdminRegister;
use App\Http\Controllers\BannersController;
use App\Http\Controllers\CoupenController;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\Head;
use App\Http\Controllers\LoginAdmin;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PartnerAssignController;
use App\Http\Controllers\PartnerBookingController;
use App\Http\Controllers\PartnerController;
use App\Http\Controllers\PersonController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\SubServiceController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


// Routes

Route::get('/Dashboards', [Dashboard::class, 'index']);

Route::get('/Head', [Head::class, 'index']);

Route::resource('/', LoginAdmin::class);

Route::get('/UserProfile', function () {
    return view('profile/userProfile');
});

Route::resource('/services', ServiceController::class);

Route::resource('/subservices', SubServiceController::class);

Route::resource('/banners', BannersController::class);

Route::resource('/users', UserController::class);

Route::post('/register_user', [PersonController::class, 'register_user']);

Route::resource('/coupens', CoupenController::class);

Route::resource('/partnerss', PartnerController::class);

Route::resource('/reviews', ReviewController::class);

Route::resource('/products', ProductController::class);

//orders
Route::resource('/order', OrderController::class);
//pending orders
Route::get('/pendingorder', [OrderController::class, 'pendingorder']);
Route::get('/completeordeViewmore/{id}', [OrderController::class, 'completeordeViewmore']);

Route::get('/pendingordeViewmore/{id}', [OrderController::class, 'pendingordeViewmore']);
//completed orders
Route::get('/completedorder', [OrderController::class, 'completedorder']);


Route::resource('/AdminLogin', LoginAdmin::class);

Route::resource('/AdminsLists', AdminList::class);

Route::get('/Logout', [LoginAdmin::class, 'logout']);

Route::get('users/{user}/address', [UserController::class, 'address'])->name('users.address');

// Route::get('/register', function () {
//     return view('register');
// });

Route::get('/Assigns/{id}/{pid}', [OrderController::class, 'updateAssign']);

Route::post('/assignPartner', [PartnerAssignController::class, 'AssignPartners']);

Route::get('/AdminProfile', [AdminProfile::class, 'index']);

Route::put('/EditProfile', [AdminProfile::class, 'EditProfile']);

Route::put('/ChangePassword', [AdminProfile::class, 'ChangePassword']);

// API Routes

Route::get('/api/getbanner', [BannersController::class, 'getBannerDataApi']);

Route::get('/api/getservice', [ServiceController::class, 'getServiceDataApi']);

Route::get('/api/getcoupen', [CoupenController::class, 'getCoupenDataApi']);

Route::post('/api/applycoupon', [CoupenController::class, 'getCouponFromCode']);

Route::post('/api/getpartner', [PartnerController::class, 'getPartnerDataApi']);

Route::get('/api/getsubservice', [SubServiceController::class, 'getServiceDataApi']);

Route::get('/api/getproduct', [ProductController::class, 'getProductDataApi']);

Route::get('/api/getMale', [ProductController::class, 'getMenProductDataApi']);

Route::get('/api/getFeMale', [ProductController::class, 'getWomenProductDataApi']);

Route::post('/login', [PersonController::class, 'login_api']);

Route::post('/api/addOrder', [OrderController::class, 'addOrder']);

Route::post('/api/getOrders', [OrderController::class, 'getOrders']);

Route::post('/api/makePayment', [OrderController::class, 'makePayment']);

Route::post('/api/getSubService', [SubServiceController::class, 'getSubService']);

Route::post('/api/getProductFromSubService', [ProductController::class, 'getProductFromSubService']);
Route::post('/api/getaddress', [AddressController::class, 'getAddress']);

Route::get('/address', [AddressController::class, 'getUserAddress']);

Route::post('/add/partner/booking', [PartnerBookingController::class, 'addPartnerBooking']);
Route::post('/get/partner/booking', [PartnerBookingController::class, 'getPartnerBooking']);

Route::post('/PartnerOrders', [PartnerAssignController::class, 'PartnerOrdersapi']);
Route::post('/completed/job', [PartnerBookingController::class, 'getPartnerBookingCompleted']);
Route::post("/api/addaddress", [AddressController::class, 'addAddress']);
Route::post("/api/editaddress", [AddressController::class, 'editAddress']);
Route::post("/api/deleteaddress", [AddressController::class, 'deleteAddress']);

Route::post("/job/start", [PartnerBookingController::class, 'jobstart']);
Route::post("/job/end", [PartnerBookingController::class, 'jobfinish']);

Route::get('/countOfCart', [OrderController::class, 'getCountOfCart']);

Route::post('/api/edituser', [PersonController::class, 'editProfile']);

Route::post('/getorder/pending/user', [PartnerBookingController::class, 'getPartnerBookingPendingCustomer']);

Route::post('/getorder/completed/user', [PartnerBookingController::class, 'getPartnerBookingCompletedCustomer']);

Route::post('/getorder/cancel/user', [PartnerBookingController::class, 'getPartnerBookingCancelCustomer']);

Route::post('/checkemail', [PersonController::class, 'checkEmail']);
Route::post('api/relatedproduct', [ProductController::class, 'getRelatedProduct']);
Route::post('api/orders', [PartnerController::class, 'getOrders']);
Route::post('api/orders/finish', [OrderController::class, 'completePartnerOrder']);