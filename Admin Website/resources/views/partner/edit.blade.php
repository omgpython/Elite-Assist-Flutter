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
                    <h5 class="card-title text-center pb-0 fs-4">Update Partnear</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('partnerss.update', $partners->id)}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Partner Name</label>
                      <div class="input-group has-validation">
                        <input type="text" name="pname" value="{{$partners->partner_name}}" class="form-control" id="yourUsername" placeholder="Enter Partner Name">
                        <span class="text-danger">
                          @error('pname')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please Enter Partner Name</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Mobile Number</label>
                        <div class="input-group has-validation">
                          <input type="text" name="mobno" value="{{$partners->mobile_no}}" class="form-control" id="yourUsername" placeholder="Enter Mobile Number">
                          <span class="text-danger">
                            @error('mobno')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Enter Mobile No</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Email Id</label>
                        <div class="input-group has-validation">
                          <input type="email" name="email" value="{{$partners->email_id}}" class="form-control" id="yourUsername" placeholder="Enter Email Id">
                          <span class="text-danger">
                            @error('email')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Email Id</div>
                        </div>
                    </div>
                    
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Aadhar Number</label>
                        <div class="input-group has-validation">
                          <input type="text" name="aadhar" value="{{$partners->aadhar_no}}" class="form-control" id="yourUsername" placeholder="Enter Aadhar Number">
                          <span class="text-danger">
                            @error('aadhar')
                              {{$message}}
                            @enderror
                          </span> 
                          <div class="invalid-feedback">Please Aadhar Number</div>
                        </div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Aadhar Pic</label>
                      <div class="input-group has-validation">
                        <input type="file" name="apic" class="form-control" id="yourPassword">
                        <span class="text-danger">
                          @error('apic')
                            {{$message}}
                          @enderror
                        </span>
                        <div class="invalid-feedback">Please Add AAdhar Pic!</div>
                      </div>
                    </div>
                    
                    <div class="Dropdown col-12">
                      <label for="yourUsername" class="form-label">Select Product Type</label>
                      <div class="input-group has-validation">
                        <select name="pid" class="form-control">
                          <option value="">--Select Product Type--</option>  
                            @foreach ($data as $item)
                            @if ($item->id==$partners->product_id)
                              <option value="{{$item->id}}" selected>@php echo $item->SsName; @endphp</option>
                            @else
                              <option value="{{$item->id}}">@php echo $item->SsName; @endphp</option>
                            @endif
                            @endforeach                  
                        </select>
                        <span class="text-danger">
                          @error('pid')
                            {{$message}}
                          @enderror
                        </span> 
                        <div class="invalid-feedback">Please Select Product Type.</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Profile Pic</label>
                        <div class="input-group has-validation">
                          <input type="file" name="ppic" class="form-control" id="yourPassword">
                          <span class="text-danger">
                            @error('ppic')
                              {{$message}}
                            @enderror
                          </span>
                          <div class="invalid-feedback">Please Profile Pic!</div>
                        </div>
                      </div>
                      <br>

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