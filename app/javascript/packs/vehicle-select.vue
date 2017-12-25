<template>
  <div class="">
    <select v-model="selected" v-on:change="updateParent">
      <option v-for="option in options">{{option}}</option>
    </select>
    <p>{{selected}}</p>
  </div>
</template>

<script>
export default {
  props: {
    selectOptions: {
      type: Array,
      required: true
    },
    vehicleAttribute: {
      type: String
    }
  },
  data() {
    return {
      selected: "",
      attribute: this.vehicleAttribute
    }
  },
  computed: {
    options: function() {
      return this.selectOptions
    }
  },
  methods: {
    updateParent: function() {
      this.$emit('updateVehicle', this.selected, this.attribute)
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
