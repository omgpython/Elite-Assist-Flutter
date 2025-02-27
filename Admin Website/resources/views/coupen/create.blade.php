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
                    <h5 class="card-title text-center pb-0 fs-4">Add Coupon</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('coupens.store')}}" method="POST" enctype="multipart/form-data">
                  
                    @csrf
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Coupen-Code</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="ccode" class="form-control" id="yourUsername" placeholder="Enter Coupen-Code">
                        <span class="text-danger">
                          @error('ccode')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please coupen_code</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Coupen-Discription</label>
                        <div class="input-group has-validation">
                          
                          <textarea name="cdescription" class="form-control" id="yourUsername" placeholder="Enter Coupen-Discription"></textarea>
                          <span class="text-danger">
                            @error('cdescription')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please coupen_Discription</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Coupen-Discount</label>
                        <div class="input-group has-validation">
                          
                          <input type="text" name="cdiscount" class="form-control" id="yourUsername" placeholder="Enter Coupen-Discount">
                          <span class="text-danger">
                            @error('cdiscount')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please coupen_discount</div>
                        </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Coupen Image</label>
                      <input type="file" name="Cpic" class="form-control" id="yourImage">
                      <span class="text-danger">
                        @error('Cpic')
                          {{$message}}
                        @enderror
                      </span>
                      <div class="invalid-feedback">Please Select Coupen Pic!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check form-switch">
                        <input class="form-check-input" name="status"
                         type="checkbox" role="switch" checked>
                        <label class="form-check-label" for="flexSwitchCheckChecked">Active Status</label>
                      </div>
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Add</button>
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