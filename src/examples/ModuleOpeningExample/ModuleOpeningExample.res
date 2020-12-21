//  Here is a module with data or methods we want to use
module ExampleData = {
  let variable=1
  let otherVariable=2
}

// To access without open is

module WithOutOpen = {
    let exampleUseWithoutOpen = ExampleData.variable + ExampleData.otherVariable
}

// which is equivalent to

module WithOpen = {
    open ExampleData
    let exampleUseWithOpen = variable + otherVariable
}
