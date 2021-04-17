@react.component
let make = () => {
  let (todo, setTodo) = React.useState(_ => "")
  let (todos, setTodos) = React.useState(_ => [])

  let onChange = event => {
    ReactEvent.Form.preventDefault(event)
    let value = ReactEvent.Form.target(event)["value"]
    setTodo(_ => value)
  }

  let todosList = Belt.Array.map(todos, todo => {
    <li key={todo}> {React.string(todo)} </li>
  })

  let onClick = _ => {
    setTodos(_ => Js.Array2.concat(todos, [todo]))
  }

  <div>
    <input onChange value=todo />
    <button onClick> {React.string("Submit")} </button>
    <ul> {React.array(todosList)} </ul>
  </div>
}
