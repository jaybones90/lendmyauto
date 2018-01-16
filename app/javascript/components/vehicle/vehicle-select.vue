<template>
  <div class="">
    <label class="control-label" v-bind:for="'vehicle_'+attribute">Please select vehicle {{attribute}}</label>
    <select class="form-control" v-model="selected" v-on:change="updateParent">
      <option v-for="option in options" v-bind:value="option" >{{option.text}}</option>
    </select>
    <span style="color:red">{{ errors[attribute] }}</span>
    <p>{{selected.text}}</p>
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
    },
    errorsFromParent: {
      type: Object
    }
  },
  data() {
    return {
      optionText: "",
      selected: "",
      attribute: this.vehicleAttribute,
    }
  },
  computed: {
    options: function() {
      return this.selectOptions
    },
    errors: function() {
      return this.errorsFromParent
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
