@include('heade')


<div class="card" style="width: 18rem;">
    <img class="card-img-top" src="..." alt="Card image cap">
    <div class="card-body">
        <form method="POST" action="/edit/partner">
      <h5 class="card-title">Partners:</h5>
      <select name="part_id">
        @foreach ($data as $item)
            <option value="{{ $item->id }}">{{ $item->partner_name }}</option>
        @endforeach
      </select>
      <button type="submit" class="btn btn-primary">Add Partner</button>
        </form>
    </div>
  </div>


@include('footer')
