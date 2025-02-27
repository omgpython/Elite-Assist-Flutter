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
                    <h5 class="card-title text-center pb-0 fs-4">Add Service</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('products.store')}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Service Name</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="pname" class="form-control" id="Pname" placeholder="Enter Service Name" >
                        <div class="invalid-feedback">Please enter Product Name.</div>
                      </div>
                      <span class="text-danger">
                        @error('pname')
                          Please Enter Service Name 
                        @enderror
                      </span> 
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Price</label>
                        <div class="input-group has-validation">
                          
                          <input type="text" name="price" class="form-control" id="Price" placeholder="Enter Price" >       
                          <div class="invalid-feedback">Please enter Price.</div>
                        </div>
                        <span class="text-danger">
                          @error('price')
                            Please Enter Price 
                          @enderror
                        </span>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Details</label>
                        <div class="input-group has-validation">
                          <textarea name="details" class="form-control" id="Details" placeholder="Enter Details" ></textarea>
                          <div class="invalid-feedback">Please enter Details.</div>
                        </div>
                        <span class="text-danger">
                          @error('details')
                            Please enter Details.
                          @enderror
                        </span> 
                    </div>

                    @php
                        $Hour = array();
                        $Hour["1"]= "less than or euqal 1 hour";
                        $Hour["2"]= "less than or euqal 2 hour";
                        $Hour["3"]= "less than or euqal 3 hour";
                        $Hour["4"]= "less than or euqal 4 hour";
                        $Hour["5"]= "less than or euqal 5 hour";
                    @endphp

                    <div class="Dropdown col-12">
                        <label for="yourUsername" class="form-label">Time</label>
                        <div class="input-group has-validation">
                          <select name="time" class="form-control">
                            <option value="">--Select Time Dueration--</option>
                            @php
                              foreach ($Hour as $key => $value) {
                                echo "<option value='$key'>$value</option>";
                              }
                            @endphp
                          </select>
                          <div class="invalid-feedback">Please Time Dueration.</div>
                        </div>
                        <span class="text-danger">
                          @error('time')
                            Please Select Time Dueration.
                          @enderror
                        </span> 
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Pic 1</label>
                        <div class="input-group has-validation">
                          <input type="file" name="pic1" class="form-control" id="yourPassword">
                          <div class="invalid-feedback">Please Select Product Pic 1!</div>
                        </div>
                        <span class="text-danger">
                          @error('pic1')
                            Please Select Service Pic 1!
                          @enderror
                        </span>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Pic 2</label>
                        <div class="input-group has-validation">
                          <input type="file" name="pic2" class="form-control" id="yourPassword">
                          <div class="invalid-feedback">Please Select Product Pic 2!</div>
                        </div>
                        <span class="text-danger">
                          @error('pic2')
                            Please Select Service Pic 2!
                          @enderror
                        </span>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Video</label>
                        <div class="input-group has-validation">
                          <input type="file" name="video" class="form-control" id="yourPassword">
                          <div class="invalid-feedback">Please Select Product video!</div>
                        </div>
                        <span class="text-danger">
                          @error('video')
                            Please Select Service video!
                          @enderror
                        </span>
                    </div>

                    @php
                        $gender = array();
                        $gender["male"]= "Male";
                        $gender["female"]= "Female";
                        $gender["NoGender"]= "No Gender Matters";
                    @endphp

                    <div class="Dropdown col-12">
                        <label for="yourUsername" class="form-label">Gender</label>
                        <div class="input-group has-validation">
                          <select name="gender" class="form-control">
                            <option value="">--Select Gender--</option>  
                            @php
                              foreach ($gender as $key => $value) {
                                echo "<option value='$key'>$value</option>";
                              }
                            @endphp                      
                          </select>
                          <div class="invalid-feedback">Please Select Gender.</div>
                        </div>
                        <span class="text-danger">
                          @error('gender')
                            Please Select Gender.
                          @enderror
                        </span> 
                    </div>

                    <div class="Dropdown col-12">
                        <label for="yourUsername" class="form-label">Select SubCategory</label>
                        <div class="input-group has-validation">
                          <select name="subservice_id" class="form-control">
                            <option value="">--Select SubCategory--</option>  
                            @foreach ($data as $item)
                                <option value="{{$item->id}}">{{$item->SsName}}</option>
                             @endforeach                       
                          </select>
                          <div class="invalid-feedback">Please Select Sub Service.</div>
                        </div>
                        <span class="text-danger">
                          @error('subservice_id')
                            Please Select Sub Category.
                          @enderror
                        </span> 
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