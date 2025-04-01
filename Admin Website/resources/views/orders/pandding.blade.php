@include('heade')
<section class="section">
    <div class="row">
        <div class="col-lg-12">
            @if ($m = Session::get('success'))
                <div class="alert alert-success mb-2" role="alert">
                    {{ $m }}
                </div>
            @endif
            @if ($m = Session::get('error'))
                <div class="alert alert-danger" role="alert">
                    {{ $m }}
                </div>
            @endif
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Orders</h5>

                    <!-- Table with stripped rows -->
                    <table class="table ">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Product-name</th>
                                <th>Amount</th>
                                <th>Total-Amount</th>
                                <th>status</th>
                                <th>date</th>
                                <th>time</th>
                                <th>Address</th>
                                <th>payment_type</th>
                                <th>Assign Order</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $item)
                                <tr>
                                    <td>{{ $loop->index + 1 }}</td>
                                    <td>{{ $item->pname }}</td>
                                    <td>{{ $item->amount }}</td>
                                    <td>{{ $item->total_amount }}</td>
                                    <td>{{ $item->status }}</td>
                                    <td>{{ $item->date }}</td>
                                    <td>{{ $item->time }}</td>
                                    <td>{{ $item->address }}</td>
                                    <td>{{ $item->payment_type }}</td>
                                    <td>
                                        <form method="POST" action="/add/partner/booking">
                                            @csrf
                                            <input type="hidden" name="pid" value="{{ $item->pid }}" />
                                            <input type="hidden" name="cid" value="{{ $item->uid }}" />
                                            <input type="hidden" name="address" value="{{ $item->address }}" />
                                            <input type="hidden" name="price" value="{{ $item->total_amount }}" />
                                            <input type="hidden" name="part_id" value="{{ $item->id }}" />
                                            <input type="hidden" name="status" value="0" />
                                            <a href="/pendingordeViewmore/{{ $item->id }}"
                                                class="btn btn-primary">View more</a>
                                            {{-- <a href="/Assigns/{{ $item->id }}" class="btn btn-primary"><i
                                                    class='bx bx-cart'></i> Assign</button> --}}
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {{ $data->links() }}
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#btndel').click(function(event) {
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
