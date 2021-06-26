<!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Tech Trial</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container mt-5 mb-5">
            @if ($message = Session::get('success'))
                <div class="alert alert-success alert-block">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>{{ $message }}</strong>
                </div>
            @endif

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Whoops!</strong> There were some problems with your input.
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <form method="POST" action="{{route('update')}}" enctype="multipart/form-data">
                @csrf
                <input name="_method" type="hidden" value="PUT">
                <input type="hidden" name="id" value="{{$property->id}}" >
                <div class="form-group">
                  <label for="county">County</label>
                  <input type="text" class="form-control" name="county" placeholder="Enter County" value="{{$property->county ?? ""}}" >
                </div>
                <div class="form-group">
                    <label for="county">Country</label>
                    <input type="text" class="form-control" name="country" placeholder="Enter Country" value="{{$property->country ?? ""}}" >
                </div>
                <div class="form-group">
                    <label for="county">Town</label>
                    <input type="text" class="form-control" name="town" placeholder="Enter Towm" value="{{$property->town ?? ""}}" >
                </div>
                <div class="form-group">
                    <label for="county">Description</label>
                    <textarea type="text" class="form-control" name="description"> {{$property->description ?? "Enter Description"}} > </textarea>
                </div>
                <div class="form-group">
                    <label for="county">Displayable Address</label>
                    <input type="text" class="form-control" name="address" placeholder="Enter Adress" value="{{$property->address ?? ""}}" >
                  </div>
                  <div class="form-group">
                    <label for="county">Image</label>
                    <input type="file" class="form-control" name="image" placeholder="Enter County">
                  </div>
                  <div class="form-group">
                    <label for="county">Number of Bedrooms</label>
                    <select class="form-control" name="bedrooms">
                        @for ($i = 1; $i < 20; $i++)
                            <option value={{$i}} {{$i == $property->bedrooms ? "selected" : ""}}> {{$i}} </option>
                        @endfor
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="county">Number of Bathrooms</label>
                    <select class="form-control" name="bathrooms">
                        @for ($i = 1; $i < 20; $i++)
                            <option value={{$i}} {{$i == $property->bathrooms ? "selected" : ""}}> {{$i}} </option>
                        @endfor
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="county">Price</label>
                    <input type="text" class="form-control" name="price" placeholder="Enter Price" value="{{$property->price}}">
                  </div>
                  <div class="form-group">
                    <label for="county">Property Type</label>
                    <select class="form-control" name="type">
                        @foreach ($types as $t)
                            <option value={{$t->id}} {{$t->id == $property->type ? "selected" : ""}}> {{$t->title}} </option>
                        @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="for_sale">Lease Type</label>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="for_sale" id="for_sale1" value="sale" {{$property->for_sale == "sale" ? "checked" : ""}}>
                        <label class="form-check-label" for="for_sale1">
                          For Sale
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="for_sale" id="for_sale2" value="rent" {{$property->for_sale == "rent" ? "checked" : ""}}>
                        <label class="form-check-label" for="for_sale2">
                          For Rent
                        </label>
                      </div>
                  </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
        </div>
    </body>
</html>
