// module is used to define a global module
module App = {
// @bs.module is used to import Javascript files into Rescript
  @bs.module("./components/App/App.jsx")
// @react.component tells compiler that we are building a React component
  @react.component
/*
This says we are assigning to the "make" binding the "default" export of this module.
All ReasonReact components are exported as "make".
Hence assigning, the default export to "make" mirrors the behavior of the component having been built in ReScript.
We also define it's type signature as a unit or empty function call that returns a React.element
*/
  external make: unit => React.element = "default"
}

/*
We now access the ReactDom module and use the render method.
We can also now use our imported App component like any React element
*/
ReactDOMRe.renderToElementWithId(<App />, "root")
