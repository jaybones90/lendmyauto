<template>
  <form action="/searches" id="search-form" method="post">
    <input type="hidden" name="authenticity_token" :value="csrfToken">
    <vue-google-autocomplete
        ref="address"
        id="search-map"
        classname="form-control"
        placeholder="Please type your address"
        country="us"
        :enable-geolocation='true'
        @placechanged="getAddressData"
    >
    </vue-google-autocomplete>
    <input type="hidden" name="search[city]" :value="city">
    <hotel-date-picker @checkInChanged="updateStartDate" @checkOutChanged="updateEndDate"></hotel-date-picker>
    <input type="hidden" name="search[date_start]" :value="date_start">
    <input type="hidden" name="search[date_end]" :value="date_end">
    <button class="btn" type="submit">Search</button>
  </form>
</template>

<script>
  import VueGoogleAutocomplete from 'vue-google-autocomplete'
  import HotelDatePicker from 'vue-hotel-datepicker'
  import axios from 'axios'
  export default {
    props: {
    },
    data() {
      return {
        search: {
          date_start: "",
          date_end: "",
          city: "",
          csrfToken: ""
        }
      }
    },
    components: {
      'vue-google-autocomplete' : VueGoogleAutocomplete,
      'hotel-date-picker' : HotelDatePicker,
    },
    computed: {
      csrfToken: function() {
        return document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      city: function() {
        return this.search.city
      },
      date_start: function() {
        return this.search.date_start
      },
      date_end: function() {
        return this.search.date_end
      }
      // errors: function() {
      //   return this.errorsFromParent
      // }
    },
    methods: {
      getAddressData: function (addressData, placeResultData, id) {
        this.search.city = addressData.locality;
      },
      updateStartDate: function(date) {
        this.search.date_start = date;
      },
      updateEndDate: function(date) {
        this.search.date_end = date;
      },
      // submitSearch: function() {
      //   axios.post('/searches', {
      //     search: this.search
      //   })
      //   .then((response) => {
      //     console.log("good",response)
      //   })
      //   .catch((error) => {
      //     console.log("bad",error.response)
      //   });
      // }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
