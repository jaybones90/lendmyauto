<template>
    <div>
      <div v-for="(value, key, index) in errors" :key="index">
        <span>{{key}} : {{value}}</span>
      </div>
      <vue-google-autocomplete
          ref="address"
          id="map"
          classname="form-control"
          placeholder="Please type your address"
          country="us"
          :enable-geolocation='true'
          @no-results-found="noResults"
          @placechanged="getAddressData"
      >
      </vue-google-autocomplete>
    </div>
</template>

<script>
  import VueGoogleAutocomplete from 'vue-google-autocomplete'
  import axios from 'axios'

  export default {
      components: { VueGoogleAutocomplete },
      props: {
        locationFromController: {
          type: Object,
          required: true
        }
      },
      data: function () {
        return {
          address: '',
          location: this.locationFromController,
          errors: {}
        }
      },
      mounted() {
        this.$refs.address.focus();
      },
      methods: {
        assignAttributesToLocation: function({street_number, route, postal_code, locality, country, administrative_area_level_1}) {
          this.location.street_address = street_number + ' ' + route;
          this.location.city = locality;
          this.location.state = administrative_area_level_1;
          this.location.zip_code = postal_code;
          this.location.country = country;
        },
        getAddressData: function (addressData, placeResultData, id) {
          this.assignAttributesToLocation(addressData);
          this.submitLocation()
        },
        noResults: function(errorObject) {
          this.errors = {
            "Address" : "was not found, Please enter a different address"
          }
        },
        submitLocation: function() {
          axios.post('/locations', {
            location: this.location
          })
          .then((response) => {
            let locationId = response.data.location.id
            window.location.href = (`/locations/${locationId}/vehicles/new`)
          })
          .catch((error) => {
            this.errors = error.response.data.errors
          });
        }
      }

  }
</script>
