
<template>
  <div>
    <vehicle-select vehicleAttribute="year" :selectOptions="vehicleYears" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-select vehicleAttribute="make" :selectOptions="vehicleMakes" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-select vehicleAttribute="model" :selectOptions="vehicleModels" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-select vehicleAttribute="style" :selectOptions="vehicleStyles" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-select vehicleAttribute="color" :selectOptions="vehicleColors" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-select vehicleAttribute="seats" :selectOptions="vehicleSeats" @updateVehicle="updateVehicleAttributes" :errorsFromParent="errors"></vehicle-select>
    <vehicle-input vehicleAttribute="milage" v-model="vehicle.milage" :errorsFromParent="errors"></vehicle-input>
    <vehicle-checkboxes :vehicleFeatures="featuresFromController" @updateCheckboxes="updateVehicleCheckboxes"></vehicle-checkboxes>
    <vehicle-input vehicleAttribute="price" v-model="vehicle.daily_price" :errorsFromParent="errors"></vehicle-input>
    <hotel-date-picker @checkInChanged="updateStartDate" @checkOutChanged="updateEndDate"></hotel-date-picker>
    <button class="btn" @click="submitVehicle">Save</button>
  </div>
</template>

<script>
import VehicleSelect from './vehicle-select.vue'
import VehicleInput from './vehicle-input.vue'
import HotelDatePicker from 'vue-hotel-datepicker'
import VehicleCheckboxes from './vehicle-checkboxes.vue'

export default {
  props: {
    vehicleFromController: {
      type: Object,
      required: true
    },
    featuresFromController: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      vehicleColors: [
        {text: "Black", value: "Black"}, {text: "Blue", value: "Blue"}, {text: "Brown", value: "Brown"},
        {text: "Gold", value: "Gold"}, {text: "Grey", value: "Grey"}, {text: "Green", value: "Green"},
        {text: "Orange", value: "Orange"}, {text: "Pink", value: "Pink"}, {text: "Purple", value: "Purple"},
        {text: "Red", value: "Red"}, {text: "Silver", value: "Silver"}, {text: "White", value: "White"},
        {text: "Yellow", value: "Yellow"}
      ],
      vehicleSeats: [
        {text: "2", value: 2}, {text: "4", value: 4}, {text: "5", value: 5},
        {text: "6", value: 6}, {text: "7", value: 7}, {text: "8", value: 8}
      ],
      vehicleYears: [""],
      vehicleMakes: [""],
      vehicleModels: [""],
      vehicleStyles: [""],
      vehicleIdForApi: "",
      vehicle: this.vehicleFromController,
      features: this.featuresFromController,
      value: "",
      errors: {}
    }
  },
  computed: {
    year() {
      return this.vehicle.year
    },
    make() {
      return this.vehicle.make
    },
    model() {
      return this.vehicle.model
    },
    style() {
      return this.vehicle.style
    }
  },
  watch: {
    year() {
      this.getVehicleOptions("makes")
    },
    make() {
      this.getVehicleOptions("models")
    },
    model() {
      this.getVehicleOptions("styles")
    },
    style() {
      this.getExactVehicle()
    }
  },
  created() {
    this.getVehicleOptions("years")
  },
  components: {
    'vehicle-select': VehicleSelect,
    'vehicle-input' : VehicleInput,
    'hotel-date-picker' : HotelDatePicker,
    'vehicle-checkboxes' : VehicleCheckboxes
  },
  methods: {
    updateVehicleAttributes(selectedValueObject, selectedAttribute) {
      let selectedText = selectedValueObject.text
      let selectedValue = selectedValueObject.value
      this.vehicle[`${selectedAttribute}`] = selectedText
      if (selectedAttribute === 'style') {
        this.vehicleIdForApi = parseInt(selectedValue)
      }
    },
    assignAttributesToVehicle({cylinders, atvtype, trany, VClass, drive, fuelType, highway08}) {
      this.vehicle.cylinders = cylinders
      this.vehicle.alternative_fuel_type = atvtype
      this.vehicle.transmission = trany
      this.vehicle.category = VClass
      this.vehicle.drive_type = drive
      this.vehicle.fuel_type = fuelType
      this.vehicle.highway_mpg = highway08
    },
    updateVehicleCheckboxes(featuresFromChild) {
      this.vehicle.feature_ids = featuresFromChild
    },
    getVehicleOptions(type) {
      var urlTypes = {
        'years': 'http://www.fueleconomy.gov/ws/rest/vehicle/menu/year',
        'makes': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=${this.vehicle.year}`,
        'models': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=${this.vehicle.year}&make=${this.vehicle.make}`,
        'styles': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?year=${this.vehicle.year}&make=${this.vehicle.make}&model=${this.vehicle.model}`
      }
      let selectedUrl = urlTypes[type]
      axios.get(selectedUrl).then((response) => {
        if (response.data.menuItem.constructor === Object) {
          response.data.menuItem = Array.of(response.data.menuItem)
        }
        if (type === "years") {
          this.vehicleYears = response.data.menuItem
        }
        if (type === "makes") {
          this.vehicleMakes = response.data.menuItem
        }
        if (type === "models") {
          this.vehicleModels = response.data.menuItem
        }
        if (type === "styles") {
          this.vehicleStyles = response.data.menuItem
        }
      })
      .catch((error) => {
        this.errors = 'Error! Could not reach the API. ' + error
      })
    },
    getExactVehicle() {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/${this.vehicleIdForApi}`).then((response)=>{
        this.assignAttributesToVehicle(response.data)
      }).catch((error) => {
        this.errors = 'Error! Could not reach the API. ' + error
      })
    },
    updateStartDate(selectedStartDate) {
      this.vehicle.availability_start = selectedStartDate
    },
    updateEndDate(selectedEndDate) {
      this.vehicle.availability_end = selectedEndDate
    },
    submitVehicle() {
      axios.post(`/locations/${this.vehicle.current_location_id}/vehicles`, {
        vehicle: this.vehicle,
      })
      .then((response) => {
        console.log("response good:", response)
        let accountId = response.data.current_user.account_id
        window.location.href = (`/accounts/${accountId}`)
      })
      .catch((response) => {
        console.log("error:", response.data.error)
        this.errors = response.data.error
      });
    },
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
