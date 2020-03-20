const initialState = {
  userType: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case "setUserType": {
      return {...state, userType: action.userType}
    }
    default:
      return state
  }
}
