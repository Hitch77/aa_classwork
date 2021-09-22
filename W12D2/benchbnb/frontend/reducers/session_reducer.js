import { RECEIVE_NEW_USER, REMOVE_USER } from "../actions/session_actions";

const _nullSession = {
    id: null
}

export default (oldState = _nullSession, action) => {
    Object.freeze(oldState)
    switch(action.type) {
        case RECEIVE_NEW_USER:
            return Object.assign({}, _nullSession[id]) 
    }
}