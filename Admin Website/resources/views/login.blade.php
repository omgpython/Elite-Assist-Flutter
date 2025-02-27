<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zxx">
<!--<![endif]-->
<!-- Begin Head -->


<!-- Mirrored from kamleshyadav.com/html/splashdash/html/main/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Jan 2025 06:02:31 GMT -->
<head>
    <title>Elite Assist Login</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="MobileOptimized" content="320">
    <!--Start Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/fonts.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/auth.css">
    <!-- Favicon Link -->
    <link rel="shortcut icon" type="image/png" href="assets/images/favicon.png">
</head>
<body>
    <div class="splash-auth-wrapper">
        <div class="splash-auth-box">
            <div class="splash-auth-content">
                <form class="row g-3 needs-validation" method="POST" action="{{route('AdminLogin.store')}}">
                  @csrf
                  @method('POST')  
                  
                    <h2>Hello, Welcome to <span>Elite Assist</span></h2>
                    <p>Fill the Details Below to Login to Your Account</p>
                    <div class="splash-auth-form">
                        <div class="splash-auth-feilds mb-30 has-validation">
                          <input type="text" name="username" class="splash-input" placeholder="Email Address" id="yourUsername">
                            {{-- <input type="text"  class="" /> --}}
                            <div class="splash-auth-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 483.3 483.3"><path d="M424.3,57.75H59.1c-32.6,0-59.1,26.5-59.1,59.1v249.6c0,32.6,26.5,59.1,59.1,59.1h365.1c32.6,0,59.1-26.5,59.1-59.1    v-249.5C483.4,84.35,456.9,57.75,424.3,57.75z M456.4,366.45c0,17.7-14.4,32.1-32.1,32.1H59.1c-17.7,0-32.1-14.4-32.1-32.1v-249.5    c0-17.7,14.4-32.1,32.1-32.1h365.1c17.7,0,32.1,14.4,32.1,32.1v249.5H456.4z" data-original="#000000" class="active-path" data-old_color="#000000" fill="currentColor"></path><path d="M304.8,238.55l118.2-106c5.5-5,6-13.5,1-19.1c-5-5.5-13.5-6-19.1-1l-163,146.3l-31.8-28.4c-0.1-0.1-0.2-0.2-0.2-0.3    c-0.7-0.7-1.4-1.3-2.2-1.9L78.3,112.35c-5.6-5-14.1-4.5-19.1,1.1c-5,5.6-4.5,14.1,1.1,19.1l119.6,106.9L60.8,350.95    c-5.4,5.1-5.7,13.6-0.6,19.1c2.7,2.8,6.3,4.3,9.9,4.3c3.3,0,6.6-1.2,9.2-3.6l120.9-113.1l32.8,29.3c2.6,2.3,5.8,3.4,9,3.4    c3.2,0,6.5-1.2,9-3.5l33.7-30.2l120.2,114.2c2.6,2.5,6,3.7,9.3,3.7c3.6,0,7.1-1.4,9.8-4.2c5.1-5.4,4.9-14-0.5-19.1L304.8,238.55z" data-original="#000000" class="active-path" data-old_color="#000000" fill="currentColor"></path></svg>
                        </div>
                        <span class="text-danger">
                          @error('username')
                            Please Enter Valid Email
                          @enderror
                      </span>
                        </div>
                        <div class="splash-auth-feilds">
                          <input type="password" name="password" placeholder="Password" class="splash-input" id="yourPassword">
                            <div class="splash-auth-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 482.8 482.8"><path d="M395.95,210.4h-7.1v-62.9c0-81.3-66.1-147.5-147.5-147.5c-81.3,0-147.5,66.1-147.5,147.5c0,7.5,6,13.5,13.5,13.5    s13.5-6,13.5-13.5c0-66.4,54-120.5,120.5-120.5c66.4,0,120.5,54,120.5,120.5v62.9h-275c-14.4,0-26.1,11.7-26.1,26.1v168.1    c0,43.1,35.1,78.2,78.2,78.2h204.9c43.1,0,78.2-35.1,78.2-78.2V236.5C422.05,222.1,410.35,210.4,395.95,210.4z M395.05,404.6    c0,28.2-22.9,51.2-51.2,51.2h-204.8c-28.2,0-51.2-22.9-51.2-51.2V237.4h307.2L395.05,404.6L395.05,404.6z" data-original="#000000" class="active-path" data-old_color="#000000" fill="currentColor"></path><path d="M241.45,399.1c27.9,0,50.5-22.7,50.5-50.5c0-27.9-22.7-50.5-50.5-50.5c-27.9,0-50.5,22.7-50.5,50.5    S213.55,399.1,241.45,399.1z M241.45,325c13,0,23.5,10.6,23.5,23.5s-10.5,23.6-23.5,23.6s-23.5-10.6-23.5-23.5    S228.45,325,241.45,325z" data-original="#000000" class="active-path" data-old_color="#000000" fill="currentColor"></path></svg>
                            </div>
                        </div>
                        <span class="text-danger">

                          @error('password')
                            Please Enter Valid Password
                          @enderror
                        </span>
                    </div>
                    <div class="splash-auth-btn">
                      <button class="splash-btn splash-login-member w-100" type="submit">Login</button>
                    </div>
                    <div class="col-12">
                      @if ($m=Session::get('success'))    
                        <center><span class="text-danger">
                          {{$m}}
                        </span></center>
                      @endif
                      @if ($m=Session::get('error'))    
                      <center><span class="text-danger">
                        {{$m}}
                      </span></center>
                      @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'8fe9fa0d8c05837d',t:'MTczNjMxNjEyNi4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='../../../../cdn-cgi/challenge-platform/h/g/scripts/jsd/849bfe45bf45/maind41d.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>

<!-- Mirrored from kamleshyadav.com/html/splashdash/html/main/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Jan 2025 06:02:31 GMT -->
</html>


{{-- <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>EliteAssist Login</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="{{asset('../assets/img/favicon.png')}}" rel="icon">
  <link href="{{asset('../assets/img/apple-touch-icon.png')}}" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="{{asset('../assets/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/boxicons/css/boxicons.min.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/quill/quill.snow.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/quill/quill.bubble.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/remixicon/remixicon.css')}}" rel="stylesheet">
  <link href="{{asset('../assets/vendor/simple-datatables/style.css')}}" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="{{asset('../assets/css/style2.css')}}" rel="stylesheet">

  
</head>

<body>
  <main>
    <div class="container">
    
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Elite Assist</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Profile</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>

                  <form class="row g-3 needs-validation" method="POST" action="{{route('AdminLogin.store')}}">
                    @csrf
                    @method('POST')
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <input type="text" name="username" class="form-control" id="yourUsername">
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                      <span class="text-danger">
                        @error('username')
                          Please Enter Valid Admin Name
                        @enderror
                      </span>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword">
                      <div class="invalid-feedback">Please enter your password!</div>
                      <span class="text-danger">

                        @error('password')
                          Please Enter Valid Admin password
                        @enderror
                      </span>
                    </div>
                    
                    <div class="col-12 mt-5">
                      <button class="btn btn-primary w-100" type="submit">Login</button>
                    </div>
                  <div class="col-12">
                    @if ($m=Session::get('success'))    
                      <center><span class="text-danger">
                        {{$m}}
                      </span></center>
                    @endif
                    @if ($m=Session::get('error'))    
                    <center><span class="text-danger">
                      {{$m}}
                    </span></center>
                    @endif
                  </div>
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html> --}}