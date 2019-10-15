import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

const types = {
  SET_NAME: 'SET_NAME',
  SET_VALUE: 'SET_VALUE',

  SET_INTERFACE: 'SET_INTERFACE',
  SET_BANKNAME: 'SET_BANKNAME',
  SET_YEAR: 'SET_YEAR'
};

const state = {
  name: null,
  value: null,



  interface: null,
  bankname: null,
  year: null
};

const getters = {
  name(){
    return state.name
  },
  value(){
    return state.value
  },
  interface(){
    return state.interface
  },
  bankname(){
    return state.bankname
  },
  year(){
    return state.year
  }
};

const mutations = {
  [types.SET_NAME](state, name){
    state.name = name;
  },
  [types.SET_VALUE](state, value){
    state.value = value;
  },
  [types.SET_INTERFACE](state, interFace){
    state.interface = interFace;
  },
  [types.SET_BANKNAME](state, bankname){
    state.bankname = bankname;
  },
  [types.SET_YEAR](state, year){
    state.year = year;
  }
};

const actions = {
  setName({commit}, name){
    commit(types.SET_NAME, name);
  },
  setValue({commit}, value){
    commit(types.SET_VALUE, value);
  },
  setInterFace({commit}, interFace){
    commit(types.SET_INTERFACE, interFace);
  },
  setBankName({commit}, bankname){
    commit(types.SET_BANKNAME, bankname);
  },
  setYear({commit}, year){
    commit(types.SET_YEAR, year);
  }
};

export default new Vuex.Store({
  state, getters, mutations, actions
})
