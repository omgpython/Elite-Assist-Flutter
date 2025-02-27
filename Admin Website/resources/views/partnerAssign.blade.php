@include('heade')

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column mt-5">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-md-6 d-flex flex-column  ">

              <!-- End Logo -->
              <div class="mb-5">
                
              </div>
              <div class="card mb-3 ms-5">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Assign Partner</h5>
                  </div>

                  <form class="row g-3 needs-validation" method="POST" action="/assignPartner" >
                    @csrf
                    
                        <input type="text" hidden name="uid" value="{{$table->uid}}"  class="form-control" id="yourUsername">
                        <input type="text" hidden name="pid" value="{{$table->pid}}"  class="form-control" id="yourUsername">
                        <input type="text" hidden name="address" value="{{$table->address}}"  class="form-control" id="yourUsername">
                        <input type="text" hidden name="price" value="{{$table->total_amount}}"  class="form-control" id="yourUsername">
                        <input type="text" hidden name="status" value="0"  class="form-control" id="yourUsername">
                        <input type="text" hidden name="id" value="{{$table->id}}"  class="form-control" id="yourUsername">
                

                    <div class="Dropdown col-12">
                      <label for="yourUsername" class="form-label">Select Partner</label>̀̀
                      <div class="input-group has-validation">
                        <select name="partner_id" class="form-control">
                          <option value="">--Select Partner--</option>
                          @foreach ($partner as $item)
                          <option value="{{$item->id}}">{{$item->partner_name}}</option>
                          @endforeach
                        </select>
                        <div class="invalid-feedback">Please Select Service.</div>
                    </div>
                    <span class="text-danger">
                      @error('partner_id')
                        <p>Please Select Partner</p>
                      @enderror
                    </span> 
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Assign</button>
                    </div>
                  </form>

                </div>
              </div>
              
            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

@include('footer')