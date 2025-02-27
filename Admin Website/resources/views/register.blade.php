@include('heade')


    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6">

  
              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create New Admin</h5>
                    <p class="text-center small">Enter New Admin details to create account</p>
                  </div>

                  <form class="row g-3 needs-validation" action="{{route('AdminsLists.store')}}" method="POST" enctype="multipart/form-data">
                  @csrf
                    <div class="col-12">
                      <label for="yourName" class="form-label">Full Name</label>
                      <input type="text" name="fname" class="form-control" id="yourName" >
                      <div class="invalid-feedback">Please, enter your name!</div>
                      <span class="text-danger">
                        @error('fname')
                          Plaese Enter Valid Full Name
                        @enderror
                      </span>
                    </div>

                    <div class="col-12">
                      <label for="yourEmail" class="form-label">Email</label>
                      <input type="email" name="email" class="form-control" id="yourEmail" >
                      <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                      <span class="text-danger">
                        @error('email')
                          Please Enter Valid Email Id
                        @enderror
                      </span>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <input type="text" name="username" class="form-control" id="yourUsername" >
                        <div class="invalid-feedback">Please choose a username.</div>
                      </div>
                      <span class="text-danger">
                        @error('username')
                          Please Enter Valid User Name
                        @enderror
                      </span>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" >
                      <div class="invalid-feedback">Please enter your password!</div>
                      <span class="text-danger">
                        @error('password')
                          Please Enter Valid Password
                        @enderror
                      </span>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Admin Pic</label>
                      <div class="input-group has-validation">
                        <input type="file" name="apic" class="form-control" id="yourPassword">
                        <div class="invalid-feedback">Please New Admin Pic!</div>
                      </div>
                      <span class="text-danger">
                        @error('apic')
                          Please Enter Valid Admin Pic 
                        @enderror
                      </span>
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Create New Admin</button>
                    </div>

                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
    @include('footer')