/*
We first define our product type.
The "description" field is not always present so we wrap it in an option
*/
type product = {
  id: string,
  name: string,
  price: float,
  quantity: int,
  description: option<string>,
}

/*
We now define a makeProduct function with named arguments.
The "description" field denotes by "?" that it is optional.
You can also set default values like we did for the "quantity" argument.
The compiler is smart enough to infer it is a product type,
because the properties match the same as above
*/
let makeProduct = (~id, ~name, ~price, ~quantity=0, ~description=?, ()) => {
  id,
  name,
  price,
  quantity,
  description
}

/*
We now change our array to use our maker function to create the records.
Note: That the last argument is always '()'.
It represents an invocation, letting the compiler know
that no additional args will be passed.
*/
let productDetails = [
  makeProduct(~id="coffee", ~name="bag of coffee", ~price=13.12, ~quantity=0, ()),
  makeProduct(
    ~id="saddle",
    ~name="emu saddle",
    ~price=50.1,
    ~quantity=0,
    ~description="For riding emus, I guess...",
    (),
  ),
  makeProduct(~id="glasses", ~name="sunglasses", ~price=15.1, ~quantity=0, ()),
  makeProduct(~id="stickers", ~name="laptop stickers", ~price=3.0, ~quantity=0, ()),
  makeProduct(
    ~id="shirt",
    ~name="t shirt",
    ~description="Now with Cats!",
    ~price=8.0,
    ~quantity=0,
    (),
  ),
  makeProduct(
    ~id="laptop",
    ~name="laptop",
    ~description="Great for coding!",
    ~price=1000.0,
    ~quantity=0,
    (),
  ),
  makeProduct(~id="desk", ~name="desk", ~price=300.0, ~quantity=0, ()),
  makeProduct(~id="chair", ~name="chair", ~price=100.0, ~quantity=0, ()),
]
