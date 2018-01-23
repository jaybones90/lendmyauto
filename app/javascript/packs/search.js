import Vue from 'vue/dist/vue.esm'
import SearchBar from '../components/search/search-bar.vue'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  var element = document.getElementById("new-search-form")
  axios.defaults.headers.post['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  if (element != null ) {
    const app = new Vue({
      el: element,
      components: { SearchBar },
    })
  }
})
