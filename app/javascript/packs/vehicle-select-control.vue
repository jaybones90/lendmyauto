
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
      vehicleIdForApi: "",
      vehicle: {
        year: "",
        make: "",
        model: "",
        style: "",
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
    },
    style() {
      return this.vehicle.style
    }
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
    },
    style() {
      this.getExactVehicle(this.vehicleIdForApi)
    }
  },
  created() {
    this.getVehicleYears()
  },
  components: {
    VehicleSelect
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
    getVehicleYears() {
      axios.get('http://www.fueleconomy.gov/ws/rest/vehicle/menu/year')
        .then((response) => {
          this.vehicleYears = response.data.menuItem
        })
      .catch((error) => {
        this.vehicleYears = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleMakes() {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=${this.vehicle.year}`)
        .then((response) => {
          this.vehicleMakes = response.data.menuItem
        })
      .catch((error) => {
        this.vehicleMakes = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleModels() {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=${this.vehicle.year}&make=${this.vehicle.make}`)
        .then((response) => {
          this.vehicleModels = response.data.menuItem
        })
      .catch((error) => {
        this.vehicleModels = 'Error! Could not reach the API. ' + error
      })
    },
    getVehicleStyles() {
      axios.get(
        `http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?year=${this.vehicle.year}&make=${this.vehicle.make}&model=${this.vehicle.model}`)
        .then((response) => {
          if (response.data.menuItem.length != undefined) {
            this.vehicleStyles = response.data.menuItem
          } else {
            this.vehicleStyles.push(" ", response.data.menuItem)
          }
        })
      .catch((error) => {
        this.vehicleStyles = 'Error! Could not reach the API. ' + error
      })
    },
    getExactVehicle(vehicleId) {
      axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/${vehicleId}`)
        .then((response) => {
          this.assignAttributesToVehicle(response.data)
          console.log(this.vehicle)
        })
      .catch((error) => {
        console.log('Error! Could not reach the API. ' + error)
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
