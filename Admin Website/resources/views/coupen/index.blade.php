@include('heade')

<section class="section">
    <div class="row">
        <div class="col-lg-12">
            @if ($m = Session::get('success'))    
                <div class="alert alert-success mb-2" role="alert">
                    {{$m}}
                </div>
            @endif
            @if ($m = Session::get('error'))    
                <div class="alert alert-danger" role="alert">
                    {{$m}}
                </div>
            @endif
            <a href="{{route('coupens.create')}}" class="btn btn-success mb-3">+Add Coupon</a>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Coupons</h5>

                    <!-- Table with stripped rows -->
                    <table class="table ">
                        <thead>
                            <tr>
                                <th>Coupen-Id</th>
                                <th>Coupon-Image</th>
                                <th>Coupon-Code</th>
                                <th>Coupon-description</th>
                                <th>Coupon-Discount</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $item)
                                <tr>
                                    <td>{{$loop->index+1}}</td>
                                    <td><img src="Coupen/{{$item->coupen_img}}" style="height: 100px; width:100px; border-radius: 100%;" /></td>
                                    <td>{{$item->coupen_code}}</td>
                                    <td>{{$item->coupen_descreption}}</td>
                                    <td>{{$item->coupen_discount}} RS</td>
                                    <td>
                                        @if ($item->status)
                                            On Air
                                        @else
                                            Off Air
                                        @endif
                                    </td>
                                    <td><a href="{{route('coupens.edit',$item->id)}}" class="btn btn-primary">Edit</a></td>
                                    <td>
                                        <form method="POST" action="{{ route('coupens.destroy', $item->id) }}" class="d-inline delete-form">
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
