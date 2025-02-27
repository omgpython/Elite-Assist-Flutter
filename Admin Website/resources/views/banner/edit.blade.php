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
                    <h5 class="card-title text-center pb-0 fs-4">Edit Banners</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('banners.update',$banner->id)}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Banner Name</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="Btitle" value={{$banner->btitle}} class="form-control" id="yourUsername" placeholder="Enter Service Name" required>
                        <span class="text-danger">
                          @error('Btitle')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please Banner Name.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Sub Service Pic</label>
                      <div class="input-group has-validation">
                        <input type="file" name="Bpic" class="form-control" id="yourPassword">
                        <span class="text-danger">
                          @error('Bpic')
                            {{$message}}
                          @enderror
                        </span>
                        <div class="invalid-feedback">Please Select Banner Pic!</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-check form-switch">
                        @if ($banner->status)
                        <input class="form-check-input" name="status"
                         type="checkbox" role="switch" checked>
                         @else
                         <input class="form-check-input" name="status"
                         type="checkbox" role="switch" 
                         >
                        @endif
                        <label class="form-check-label" for="flexSwitchCheckChecked">Active Status</label>
                      </div>
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Update</button>
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