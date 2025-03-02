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
        <a href="{{route('products.create')}}" class="btn btn-success mb-3">+Add Service</a>
        <div class="card">
          <div class="card-body">
            <h5 class="card-title mb-3">Services</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Service-Id</th>
                  <th>Service-Name</th>
                  <th>Price</th>
                  <th>Time</th>
                  <th>Service-pic1</th>
                  <th>Service-pic2</th>
                  <th>Service-vid</th>
                  <th>Gender</th>
                  <th>Sub-Category</th>
                  <th>Update</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($data as $item)
                  <tr>
                    <td style="height: 50px; width:50px;">{{$loop->index+1}}</td>
                    <td>{{$item->product_name}}</td>
                    <td>{{$item->price}}</td>
                    <td>{{$item->time}}</td>
                    <td><img src='product/{{$item->product_pic1}}' style="height: 50px; width:50px"/></td>
                    <td><img src='product/{{$item->product_pic2}}' style="height: 50px; width:50px"/></td>
                    <td>
                      <video width="100" height="50" controls>
                        <source src="product_video/{{$item->product_vid}}" type="video/mp4">
                        Your browser does not support the video tag.
                      </video>
                    </td>
                    <td>{{$item->gender}}</td>
                    <td>
                      @php
                        foreach ($sub as $subs) {
                          if($item->SubService_id == $subs->id){
                            echo $subs->SsName;
                          }
                        }
                      @endphp
                    </td>
                    <td><a href="/products/{{$item->id}}/edit" class="btn btn-primary">Edit</a></td>
                    <td>
                      <form method="POST" action="/products/{{$item->id}}" class="d-inline delete-form">
                        @csrf
                        @method('delete')
                        <button type="button" class="btn btn-danger btn-delete" data-id="{{ $item->id }}" data-toggle="tooltip" title='Delete'>
                          <i class="fa fa-trash"></i> Delete
                        </button>
                      </form>
                    </td>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
    $(document).on('click', '.btn-delete', function (event) {
      event.preventDefault();
      var form = $(this).closest(".delete-form");
      swal({
        title: "Are you sure you want to delete this item?",
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
