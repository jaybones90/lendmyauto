
<template>
  <div>
    <vehicle-select vehicleAttribute="year" :selectOptions="vehicleYears" @updateVehicle="updateVehicleAttributes"></vehicle-select>
    <vehicle-select vehicleAttribute="make" :selectOptions="vehicleMakes" @updateVehicle="updateVehicleAttributes"></vehicle-select>
    <vehicle-select vehicleAttribute="model" :selectOptions="vehicleModels" @updateVehicle="updateVehicleAttributes"></vehicle-select>
    <vehicle-select vehicleAttribute="style" :selectOptions="vehicleStyles" @updateVehicle="updateVehicleAttributes"></vehicle-select>
  </div>
</template>

<script>
import VehicleSelect from './vehicle-select.vue'

export default {
  data() {
    return {
      vehicleYears: [],
      vehicleMakes: [],
      vehicleModels: [],
      vehicleStyles: [],
      vehicle: {
        year: "",
        make: "",
        model: "",
        style: ""
      }
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
    }
  },
  created() {
    this.getVehicleYears()
  },
  watch: {
    year() {
      this.getVehicleMakes()
    },
    make() {
      this.getVehicleModels()
    },
    model() {
      this.getVehicleStyles()
    }
  },
  components: {
    VehicleSelect
  },
  methods: {
    updateVehicleAttributes(selectedValue, selectedAttribute) {
      if (this.vehicle.hasOwnProperty(`${selectedAttribute}`)) {
        this.vehicle[`${selectedAttribute}`] = selectedValue
      }
    },
    getVehicleYears() {
      axios.get('http://www.fueleconomy.gov/ws/rest/vehicle/menu/year')
        .then((response) => {
          this.vehicleYears = response.data.menuItem.map((item) => {
            return parseInt(item.value)
          })
        })
      .catch((error) => {
        this.vehicleYears = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleMakes() {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=${this.vehicle.year}`)
        .then((response) => {
          this.vehicleMakes = response.data.menuItem.map((item) => {
            return item.value
          })
        })
      .catch((error) => {
        this.vehicleMakes = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleModels() {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=${this.vehicle.year}&make=${this.vehicle.make}`)
        .then((response) => {
          this.vehicleModels = response.data.menuItem.map((item) => {
            return item.value
          })
        })
      .catch((error) => {
        this.vehicleModels = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleStyles() {
      axios.get(
        `http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?year=${this.vehicle.year}&make=${this.vehicle.make}&model=${this.vehicle.model}`)
        .then((response) => {
          this.vehicleStyles = response.data.menuItem.map((item) => {
            return item.text
          })
        })
      .catch((error) => {
        this.vehicleStyles = 'Error! Could not reach the API. ' + error
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
