const initialState = {
  userType: null,
  needs: null,
  coords: null,
  address: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case "LANDING_SET_USER_TYPE": {
      return {...state, userType: action.userType}
    }
    case "LANDING_SET_NEEDS": {
      return {...state, needs: action.needs}
    }
    case "LANDING_SET_COORDS": {
      return {...state, coords: action.coords}
    }
    case "LANDING_SET_ADDRESS": {
      return {...state, address: action.address}
    }
    default:
      return state
  }
}
