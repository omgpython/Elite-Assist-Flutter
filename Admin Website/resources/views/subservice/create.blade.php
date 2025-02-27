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
                    <h5 class="card-title text-center pb-0 fs-4">Add Sub-Category</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('subservices.store')}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Sub-Category Name</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="Ssname" class="form-control" id="yourUsername" placeholder="Enter Category Name" >
                        <span class="text-danger">
                          @error('Ssname')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please enter Sub Category Name.</div>
                      </div>
                    </div>

                    <div class="Dropdown col-12">
                      <label for="yourUsername" class="form-label">Category Name</label>
                      <div class="input-group has-validation">
                        <select name="Sid" class="form-control">
                          <option value="">--Select Category--</option>
                          @foreach ($data as $item)
                          <option value="{{$item->id}}">{{$item->Sname}}</option>
                          @endforeach
                        </select>
                        <span class="text-danger">
                          @error('Sid')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please Select Service.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Sub-Category Pic</label>
                      <div class="input-group has-validation">
                        <input type="file" name="Sspic" class="form-control" id="yourPassword">
                        <span class="text-danger">
                          @error('Sspic')
                            {{$message}}
                          @enderror
                        </span>
                        <div class="invalid-feedback">Please Select Sub Service Pic!</div>
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