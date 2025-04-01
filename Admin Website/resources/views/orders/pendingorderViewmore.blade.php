@include('heade')
{{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" /> --}}
<div class="card" style="background-color:white;">
    <center>
        <h1 class="mb-2 mt-3">Customer Details <i class="fa-solid fa-user"></i> </h1>
    </center>
    <div class="card-body">
        <div class="row">
            <div class="col-5">
                <img src="/product/{{ $pendingorder->ppic }}" alt="" style="height:290px;width:350px;"
                    class="img-thumbnail">
                <h4 style="margin-left:120px;">{{ $pendingorder->pname }}</h4>
                <h4 style="margin-left:120px;">₹{{ $pendingorder->total_amount }}/-</h4>

            </div>
            <div class="col-7">
                <h3>username : {{ $pendingorder->uname }}</h3>
                <p style="font-size:20px;" class="mt-3">Contact no : {{ $pendingorder->ucontact }}</p>
                <p style="font-size:20px;"> Address : {{ $pendingorder->address }}</p>
            </div>
        </div>
    </div>
</div>
<div class="card" style="background-color:white">
    <center>
        <h1 class="mb-2 mt-3">Partner Details <i class="fa-solid fa-user"></i> </h1>
    </center>
    <div class="card-body">
        <div class="row">
            <div class="col-5">
                <img src="/partners/{{ $pendingorder->partner_pic }}" alt="" style="height:290px;width:350px;"
                    class="img-thumbnail">

            </div>
            <div class="col-7">
                <h3>Partner Name : {{ $pendingorder->partner_name }}</h3>
                <p style="font-size:20px;" class="mt-3">Contact no : {{ $pendingorder->partner_contact }}</p>
                <p style="font-size:20px;">Date : {{ $pendingorder->date }} | Time : {{ $pendingorder->time }}</p>
                <p style="font-size:20px;color:green;" class="mt-3">Payment : {{ $pendingorder->payment_type }}</p>

            </div>
        </div>
    </div>
</div>
@include('footer')
