@react.component
let make =
(~deleteFromCart, ~updateCart, ~name, ~description, ~quantity, ~price, ~id) => {
  open MaterialUi
  let (newProductTotal, setNewProductTotal) = React.useState(_ => 0)
// We can write a helper to determine whether to render a text element or not
  let descriptionTextHelper = descriptionText =>
    descriptionText !== "" ?
    `: ${descriptionText}` -> React.string
    : React.null

  <TableRow key={name}>
    <TableCell scope="row">
      <strong> {name -> React.string} </strong>
    //   We can handle the optional description value with a helper function
      {description -> Belt.Option.getWithDefault("") -> descriptionTextHelper}
    </TableCell>
    <TableCell align=#Right> {price -> React.float} </TableCell>
    <TableCell align=#Right> {quantity -> React.int} </TableCell>
    <TableCell align=#Right>
      <TextField
        _type="number"
        id="standard-basic"
        value={newProductTotal -> TextField.Value.int}
        label={"New Quantity"->React.string}
        onChange={(e: ReactEvent.Form.t) =>
          setNewProductTotal((e->ReactEvent.Form.target)["value"])}
      />
    </TableCell>
    <TableCell align=#Right>
      <ProductActions
        deleteFromCartResetField={(_: ReactEvent.Mouse.t) => {
          deleteFromCart(id)
          setNewProductTotal(_ => 0)
        }}
        updateCartResetField={(_: ReactEvent.Mouse.t) => {
          updateCart(id, newProductTotal)
          setNewProductTotal(_ => 0)
        }}
      />
    </TableCell>
  </TableRow>
}
