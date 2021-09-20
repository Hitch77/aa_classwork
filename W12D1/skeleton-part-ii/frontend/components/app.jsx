import { Route, Switch } from "react-router-dom"
import PokemonIndexContainer from "./pokemon/pokemon_index_container"
import React from "react"

const App = () => (
    <Switch>
    <Route path="/" component={PokemonIndexContainer}/>
    {/* <Route path="/pokemon/:id" component={PokemonDetail}/> */}
    </Switch>
)

export default App