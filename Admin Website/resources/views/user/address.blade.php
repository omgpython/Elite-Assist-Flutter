@include('heade')

<section class="section">
    <div class="row">
      <div class="col-lg-12">
        @if ($m=Session::get('success'))    
          <div class="alert alert-success mb-2" role="alert">
            {{$m}}
          </div>
        @endif
        @if ($m=Session::get('error'))    
          <div class="alert alert-danger" role="alert">
            {{$m}}
          </div>
        @endif
        <div class="card">
          <div class="card-body">
            <h5 class="card-title mb-3">User Address</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Address-Id</th>
                  <th>User Id</th>
                  <th>Type</th>
                  <th>Address</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($data as $item)
                  <tr>
                    <td>{{$item->id}}</td>
                    <td>{{$item->uid}}</td>
                    <td>{{$item->type}}</td>
                    <td style="width: 350px">{{$item->houseno .", ". $item->street .", ".  $item->landmark .", ". $item->area .", ". $item->city .", ". $item->state ." - ". $item->pincode}}</td>
                  </tr>
                @endforeach
              </tbody>
            </table>
            {{$data->links()}}
          </div>
        </div>
      </div>
    </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
 $(document).ready(function () {
    $('#btndel').click(function (event) {
      var form = $(this).closest("form");
      event.preventDefault();
      swal({
        title: "DELETE", // Assuming DELETE is the correct string for the title
        text: "If you delete this, it will be gone forever.",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          form.submit();
        }
      });
    });
  });
  
</script>
@include('footer')
