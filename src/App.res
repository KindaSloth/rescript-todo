module Render = {
  let map = (items, fn) =>
    items->Belt.Array.mapWithIndex((index, item) => fn(item, index->Js.Int.toString))->React.array

  let string = React.string
}

@react.component
let make = () => {
  open Render

  let (todo, setTodo) = React.useState(_ => "")
  let (todos, setTodos) = React.useState(_ => [])

  let onChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setTodo(_ => value)
  }

  let onSubmit = event => {
    ReactEvent.Form.preventDefault(event)
    setTodos(_ => Belt.Array.concat(todos, [todo]))
  }

  <div>
    <form onSubmit> <input onChange value=todo /> <button> {string("Submit")} </button> </form>
    <ul> {todos->map((todo, index) => <li key={index}> {string(todo)} </li>)} </ul>
  </div>
}
