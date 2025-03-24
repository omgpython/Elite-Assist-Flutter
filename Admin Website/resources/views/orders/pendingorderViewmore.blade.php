@include('heade')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
{{-- 
<div class="card  text-center">
    <div class="card-body">
        <h1>{{ $pendingorder->uname }}</h1>
        <h1>{{ $pendingorder->ucontact }}</h1>
        <h1>{{ $pendingorder->pname }}</h1>
        <h1>{{ $pendingorder->amount }}</h1>
        <h1>{{ $pendingorder->gst_amt }}</h1>
        <h1>{{ $pendingorder->uname }}</h1>
        <h1>{{ $pendingorder->uname }}</h1>
    </div>
</div> --}}
<div class="card" style="background-color: rgba(128, 128, 128, 0.185);">
    <center><h1 class="mb-2">Customer Details <i class="fa-solid fa-user"></i> </h1></center>
    <div class="card-body">
        <div class="row">
            <div class="col-4">
                <img src="/product/{{ $pendingorder->ppic }}" alt="" style="height:290px;width:350px;"
                    class="img-thumbnail">
            </div>
            <div class="col-8">
                <h3>username  : {{ $pendingorder->uname }}</p>
                <h3>Contact no : {{ $pendingorder->ucontact }}</p>

            </div>
        </div>
    </div>
</div>


@include('footer')
