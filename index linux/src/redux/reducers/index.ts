/* eslint-disable import/no-anonymous-default-export */
import appReducer from 'src/redux/reducers/app-reducer';

const { combineReducers } = require('redux');

const reducers = combineReducers({
    appReducer,
});

export default (state: any, action: any) => reducers(state, action);
