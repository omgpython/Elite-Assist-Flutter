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
                    <h5 class="card-title text-center pb-0 fs-4">Update Service</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('products.update', $products->id)}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Service Name</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="pname" value="{{$products->product_name}}" class="form-control" id="Pname" placeholder="Enter Service Name" >
                        <span class="text-danger">
                          @error('pname')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please enter Product Name.</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Price</label>
                        <div class="input-group has-validation">
                          
                          <input type="text" value="{{$products->price}}" name="price" class="form-control" id="Price" placeholder="Enter Price" >
                          <span class="text-danger">
                            @error('price')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please enter Price.</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Details</label>
                        <div class="input-group has-validation">
                          <textarea name="details" class="form-control" id="Details" placeholder="Enter Details" >{{$products->details}}</textarea>
                          <span class="text-danger">
                            @error('details')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please enter Details.</div>
                        </div>
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
                                if ($key == $products->time ) {
                                  echo "<option value='$key' selected>$value</option>";
                                }else {
                                  echo "<option value='$key'>$value</option>";
                                }
                              }
                            @endphp                       
                          </select>
                          <span class="text-danger">
                            @error('time')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Time Dueration.</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Pic 1</label>
                        <div class="input-group has-validation">
                          <input type="file" name="pic1" class="form-control" id="yourPassword">
                          <span class="text-danger">
                            @error('pic1')
                              {{$message}}
                            @enderror
                          </span>
                          <div class="invalid-feedback">Please Select Product Pic 1!</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Pic 2</label>
                        <div class="input-group has-validation">
                          <input type="file" name="pic2" class="form-control" id="yourPassword">
                          <span class="text-danger">
                            @error('pic2')
                              {{$message}}
                            @enderror
                          </span>
                          <div class="invalid-feedback">Please Select Product Pic 2!</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Service Video</label>
                        <div class="input-group has-validation">
                          <input type="file" name="video" class="form-control" id="yourPassword">
                          <span class="text-danger">
                            @error('video')
                              {{$message}}
                            @enderror
                          </span>
                          <div class="invalid-feedback">Please Select Service video!</div>
                        </div>
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
                                if ($key == $products->gender ) {
                                  echo "<option value='$key' selected>$value</option>";
                                }else {
                                  echo "<option value='$key'>$value</option>";
                                }
                              }
                            @endphp                      
                          </select>
                          <span class="text-danger">
                            @error('gender')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Select Gender.</div>
                        </div>
                    </div>

               
                    <div class="Dropdown col-12">
                        <label for="yourUsername" class="form-label">Select SubCategory</label>
                        <div class="input-group has-validation">
                          <select name="subservice_id" class="form-control">
                            <option value="">--Select SubCategory--</option>  
                              @foreach ($data as $item)
                              @if ($item->id==$products->SubService_id)
                                <option value="{{$item->id}}" selected>@php echo $item->SsName; @endphp</option>
                              @else
                                <option value="{{$item->id}}">@php echo $item->SsName; @endphp</option>
                              @endif
                              @endforeach                  
                          </select>
                          <span class="text-danger">
                            @error('subservice_id')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Select SubCategory.</div>
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