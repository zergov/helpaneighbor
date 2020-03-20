const initialState = {
  userType: null,
  needs: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case "LANDING_SET_USER_TYPE": {
      return {...state, userType: action.userType}
    }
    case "LANDING_SET_NEEDS": {
      return {...state, needs: action.needs}
    }
    default:
      return state
  }
}
