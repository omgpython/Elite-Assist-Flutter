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
            <h5 class="card-title">Reviews</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Review-Id</th>
                  <th>Review-Title</th>
                  <th>Review-Description</th>
                  <th>Stars</th>
                  <th>User_Id</th>
                  <th>Product_Id</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($data as $item)
                  <tr>
                    <td>{{$loop->index+1}}</td>
                    <td>{{$item->review_title}}</td>
                    <td>{{$item->review_description}}</td>
                    <td>
                        @php    
                            $s = $item->star
                        @endphp
                        @for ($i = 1; $i <= $s; $i++)    
                            <i class='bx bxs-star'></i>
                        @endfor
                    </td>
                    <td>{{$item->product_id}}</td>
                    <td>{{$item->user_id}}</td>
                    <td>
                        <form method="POST" action="{{ route('reviews.destroy', $item->id) }}" class="d-inline">
                            @csrf
                            @method('delete')
                            <input name="_method" type="hidden" value="DELETE">
                            <button type="submit" class="btn btn-danger content-icon show_confirm mt-1 ms-2" id="btndel" data-toggle="tooltip" title='Delete'>
                                <i class="fa fa-trash"></i>Delete
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
<script type="text/javascript">
 $(document).ready(function () {
        $(document).on('click', '#btndel', function (event) {
            var form = $(this).closest("form");
            event.preventDefault();
            swal({
                title: "DELETE",
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
