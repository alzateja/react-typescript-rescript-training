// We always start with the @react.component decorator
@react.component
// We then assign the variable "make" the definition of our component
// The  `~arg` is used to pass named arguments for our components
let make = (~deleteFromCartResetField, ~updateCartResetField) => {
/*
On this line, we are opening MaterialUI and Icons, so we don't have to preface every useage with the Module.
We can avoid decalring example, "<MaterialUI.IconButton/>".
This gets annoying with larger components
*/
  open MaterialUi
  open Icons
  <>
  /* We pass our color as Primary according to the Reason binding.
  Spoiler: This is wrong but the compiler will help us
  */
    <IconButton color="Primary" onClick={updateCartResetField}>
      <AddShoppingCartIcon />
    </IconButton>
    <IconButton onClick={deleteFromCartResetField}>
      <DeleteIcon />
    </IconButton>
  </>
}
