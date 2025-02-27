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
        <a href="{{route('partnerss.create')}}" class="btn btn-success mb-3">+Add Partnear</a>
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Partners</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Partner_Id</th>
                  <th>Profile_Pic</th>
                  <th>partner_name</th>
                  <th>Mobile_No</th>
                  <th>Email_Id</th>
                  <th>Aadhar_No</th>
                  <th>Product_Type</th>
                  <th>Update</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($data as $item)
                  <tr>
                    <td>{{$loop->index+1}}</td>
                    <td><img src="partners/{{$item->partner_pic}}" style="height: 100px; width: 100px; border-radius: 100%;"></td>
                    <td>{{$item->partner_name}}</td>
                    <td>{{$item->mobile_no}}</td>
                    <td>{{$item->email_id}}</td>
                    <td>{{$item->aadhar_no}}</td>
                    <td>
                      @php
                        foreach ($Sub as $item1) {
                          if($item->product_id == $item1->id){
                            echo $item1->SsName;
                          }
                        }
                      @endphp
                    </td>
                    <td><a href="{{route('partnerss.edit',$item->id)}}" class="btn btn-primary">Edit</a></td>
                    <td>
                      
                        <form method="POST" action="/partnerss/{{$item->id}}" class="d-inline">
                          @csrf
                          @method('delete')
                          <input name="_method" type="hidden" value="DELETE">
                          <button type="submit" id="btndel" class="btn btn-danger content-icon show_confirm mt-1 ms-2" data-toggle="tooltip" title='Delete'><i class="fa fa-trash"></i>Delete</button>
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
