@react.component
let make = (~deleteFromCart, ~updateCart, ~cart) => {
  open MaterialUi
  open Product

  <TableContainer
  component={TableContainer.Component.string("Paper")}
  className="product-table"
  >
    <Table>
      <TableHead>
        <TableRow>
          <TableCell> {"Product Name"->React.string} </TableCell>
          <TableCell align=#Right> {"Price"->React.string} </TableCell>
          <TableCell align=#Right> {"Current Quantity"->React.string} </TableCell>
          <TableCell align=#Right> {"New Quantity "->React.string}  </TableCell>
          <TableCell align=#Right> {"Actions"->React.string}  </TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {cart
        ->Belt.Array.map((product) =>
// The only thing to note here is that we have to explicity pass each prop.
// We are unable to spread props
          <ProductRow
            id={product.id}
            name={product.name}
            description={product.description}
            quantity={product.quantity}
            price={product.price}
            deleteFromCart={deleteFromCart}
            updateCart={updateCart}
          />
        )
// When mapping an array of components we use the React.array method
        ->React.array}
      </TableBody>
    </Table>
  </TableContainer>
}
