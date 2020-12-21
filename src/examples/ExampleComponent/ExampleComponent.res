@gentype
@react.component
let make = (~name) => {
<>
    <p>{React.string(`Hello ${name}`)}</p>
</>
}
