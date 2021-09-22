import React from "react";
import ReactDOM from "react-dom";
import { signUp, logIn } from "./actions/session_actions"
import configureStore from "./store/store";

const store = configureStore();

document.addEventListener("DOMContentLoaded", () => {
    window.getState = store.getState
    window.dispatch = store.dispatch
    window.signUp = signUp;
    window.logIn = logIn
    const root = document.getElementById("root");
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});