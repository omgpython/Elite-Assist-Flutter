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
        <a href="{{route('banners.create')}}" class="btn btn-success mb-3">+Add Banner</a>
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Banners</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Pic</th>
                  <th>Banner Name</th>
                  <th>Status</th>
                  <th>Update</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($banners as $item)
                  <tr>
                    <td>{{$loop->index+1}}</td>
                    <td><img style="height: 100px; width:200px;" src="banner/{{$item->pic}}"></td>
                    <td>{{$item->btitle}}</td>
                    <td>
                      @if ($item->status)
                        On Air
                      @else
                        Off Air
                      @endif
                    </td>
                    <td><a href="{{route('banners.edit',$item->id)}}" class="btn btn-primary">Edit</a></td>
                    <td>
                      <form method="POST" action="{{ route('banners.destroy', $item->id) }}" class="d-inline delete-form">
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
            {{$banners->links()}}
          </div>
        </div>
      </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
    $('.btn-delete').click(function (event) {
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
