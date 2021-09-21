export const RECEIVE_NEW_USER = 'RECEIVE_NEW_USER'
export const REMOVE_USER = 'REMOVE_USER'

import {createUser, createSession, deleteSession} from '../util/session_api_util'

const receiveCurrentUser = user => ({
    type: RECEIVE_NEW_USER,
    user 
})

const logoutCurrentUser = () => ({
    type: REMOVE_USER,
})

// const receiveErrors = (errors) => ({
//     type: 
// })

export const logIn = user => dispatch => (
    createSession(user) 
        .then(user => dispatch(receiveCurrentUser(user))) 
)

