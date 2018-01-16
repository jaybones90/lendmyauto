<template>
    <div>
      <vue-google-autocomplete
          ref="address"
          id="map"
          classname="form-control"
          placeholder="Please type your address"
          v-on:placechanged="getAddressData"
          country="us"
          enable-geolocation=true
      >
      </vue-google-autocomplete>
      <button class='btn' @click='submitLocation'>Submit</button>
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
          location: this.locationFromController
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
        },
        submitLocation: function() {
          axios.post('/locations', {
            location: this.location
          })
          .then((response) => {
            let locationId = response.data.location.id
            window.location.href = (`/locations/${locationId}/vehicles/new`)
            console.log(response)
          })
          .catch((response) => {
            console.log(response)
          })
        }
      }

  }
</script>
