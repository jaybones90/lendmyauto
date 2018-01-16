import Vue from 'vue/dist/vue.esm'
import LocationForm from '../components/location/location-form.vue'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  var element = document.getElementById("new-location-form")
  axios.defaults.headers.post['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  if (element != null ) {
    const app = new Vue({
      el: element,
      components: { LocationForm },
    })
  }
})
