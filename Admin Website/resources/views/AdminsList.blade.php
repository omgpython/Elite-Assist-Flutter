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
        <a href="{{route('AdminsLists.create')}}" class="btn btn-success mb-3">+Add Admins</a>
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Admins</h5>

            <!-- Table with stripped rows -->
            <table class="table ">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Admin Pic</th>
                  <th>FullName</th>
                  <th>Email</th>
                  <th>username</th>
                  <th>Password</th>
                  <th>Delete</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($Admins_Lists as $item)
                  <tr>
                    <td>{{$loop->index+1}}</td>
                    <td><img style="height: 100px; width:100px;border-radius: 100%" src="Admin/{{$item->Admin_pic}}"></td>
                    <td>{{$item->fullname}}</td>
                    <td>{{$item->email}}</td>
                    <td>{{$item->username}}</td>
                    <td>{{$item->password}}</td>
                    <td>
                      <form method="POST" action="{{ route('AdminsLists.destroy', $item->id) }}" class="d-inline">
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
             {{$Admins_Lists->links()}}
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