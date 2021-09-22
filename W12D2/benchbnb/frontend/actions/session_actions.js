export const RECEIVE_NEW_USER = 'RECEIVE_NEW_USER'
export const REMOVE_USER = 'REMOVE_USER'
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS'

import {createUser, createSession, deleteSession} from '../util/session_api_util'

const receiveCurrentUser = user => ({
    type: RECEIVE_NEW_USER,
    user 
})

const logoutCurrentUser = () => ({
    type: REMOVE_USER,
})

const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    errors
})

// const receiveErrors = (errors) => ({
//     type: 
// })

export const logIn = user => dispatch => (
    createSession(user) 
        .then(user => dispatch(receiveCurrentUser(user)), errors => console.log(errors)) 
)

export const logOut = () => dispatch => (
    deleteSession()
        .then(() => dispatch(logoutCurrentUser()))
)

export const signUp = (user) => dispatch => (
    createUser(user)
        .then(user => dispatch(receiveCurrentUser(user)))
)



