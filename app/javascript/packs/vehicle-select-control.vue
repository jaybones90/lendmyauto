
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
      errors: [],
      vehicleYears: [""],
      vehicleMakes: [""],
      vehicleModels: [""],
      vehicleStyles: [""],
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
      this.getVehicleOptions("makes")
    },
    make() {
      this.getVehicleOptions("models")
    },
    model() {
      this.getVehicleOptions("styles")
    },
    style() {
      this.getVehicleOptions("id")
    }
  },
  created() {
    this.getVehicleOptions("years")
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
    getVehicleOptions(type) {
      var urlTypes = {
        'years': 'http://www.fueleconomy.gov/ws/rest/vehicle/menu/year',
        'makes': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=${this.vehicle.year}`,
        'models': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=${this.vehicle.year}&make=${this.vehicle.make}`,
        'styles': `http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?year=${this.vehicle.year}&make=${this.vehicle.make}&model=${this.vehicle.model}`,
        'id': `http://www.fueleconomy.gov/ws/rest/vehicle/${this.vehicleIdForApi}`
      }
      let selectedUrl = urlTypes[type]
      axios.get(selectedUrl).then((response) => {
        if (response.data.menuItem.length === undefined) {
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
        if (type === "id" && this.vehicleIdForApi !== "") {
          this.assignAttributesToVehicle(response.data)
        }
      })
      .catch((error) => {
        this.errors = 'Error! Could not reach the API. ' + error
      })
    },
    // getExactVehicle(vehicleId) {
    //   axios.get(`http://www.fueleconomy.gov/ws/rest/vehicle/${vehicleId}`)
    //     .then((response) => {
    //       this.assignAttributesToVehicle(response.data)
    //     })
    //   .catch((error) => {
    //     console.log('Error! Could not reach the API. ' + error)
    //   })
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
