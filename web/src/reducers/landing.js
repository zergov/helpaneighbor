const initialState = {
  userType: null,
  needs: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case "setUserType": {
      return {...state, userType: action.userType}
    }
    case "setNeeds": {
      return {...state, needs: action.needs}
    }
    default:
      return state
  }
}
