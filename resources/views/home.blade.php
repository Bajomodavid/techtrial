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

        <div class="container mt-5">
            <div class="mb-3">
                <form action="" class="form-inline">
                    <input type="text" class="form-control" placeholder="Enter Name" name="name">
                    <select class="form-control ml-2" name="bedrooms">
                        <option value="">Select No of Bedrooms</option>
                        @for ($i = 1; $i < 20; $i++)
                            <option value={{$i}}> {{$i}} </option>
                        @endfor
                    </select>
                    <select class="form-control ml-2" name="bathrooms">
                        <option value="">Select No of Bathrooms</option>
                        @for ($i = 1; $i < 20; $i++)
                            <option value={{$i}}> {{$i}} </option>
                        @endfor
                    </select>
                    <select class="form-control ml-2" name="type">
                        <option value="">Select Property type</option>
                        @foreach ($types as $t)
                            <option value="{{$t->id}}"> {{$t->title}} </option>
                        @endforeach
                    </select>
                    <div class="form-group ml-3">
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="for_sale" id="for_sale1" value="sale">
                            <label class="form-check-label" for="for_sale1">
                              For Sale
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input ml-2" type="radio" name="for_sale" id="for_sale2" value="rent">
                            <label class="form-check-label" for="for_sale2">
                              For Rent
                            </label>
                          </div>
                    </div> <br />
                    <button type="submit" class="btn btn-info ml-2 mt-2"> Search </button>
                </form>
            </div>
            <a href="{{route('add')}}" class="btn btn-success mb-2 btn-lg">Add Property</a>
            <table class="table table-bordered">
                <thead>
                    <tr class="table-primary">
                        <th scope="col">Actions</th>
                        <th scope="col">County</th>
                        <th scope="col">Country</th>
                        <th scope="col">Town</th>
                        <th scope="col">Description</th>
                        <th scope="col">Address</th>
                        {{-- <th scope="col">Image</th> --}}
                        <th scope="col">Thumbnail</th>
                        <th scope="col">Latitude</th>
                        <th scope="col">Longitude</th>
                        <th scope="col">Bedrooms</th>
                        <th scope="col">Bathrooms</th>
                        <th scope="col">price</th>
                        <th scope="col">Type</th>
                        <th scope="col">Lease Type</th>
                    </tr>
                </thead>
                <tbody>

                    @foreach($response as $item)
                    <tr>
                        <th scope="row">
                            <a href="{{route('delete', $item->id)}}" class="btn btn-danger mb-2">X</a>
                            <a href="{{route('edit', $item->id)}}" class="btn btn-info">Edit</a>
                        </th>
                        <td>{{ $item->county }}</td>
                        <td>{{ $item->country }}</td>
                        <td>{{ $item->town }}</td>
                        <td>{{ $item->description }}</td>
                        <td>{{ $item->address }}</td>
                        {{-- <td> <img src="{{ $item->image }}" height="100px" /></td> --}}
                        <td> <img src="{{ $item->thumbnail }}" height="100px" /></td>
                        <td>{{ $item->latitude }}</td>
                        <td>{{ $item->longitude }}</td>
                        <td>{{ $item->bedrooms }}</td>
                        <td>{{ $item->bathrooms }}</td>
                        <td>{{ $item->price }}</td>
                        <td>{{ $item->for_sale }}</td>
                        <td>{{ $item->houseType->title }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                {{ $response->links() }}
            </div>
        </>
    </body>
</html>
