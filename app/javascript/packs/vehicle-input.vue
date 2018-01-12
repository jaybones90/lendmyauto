<template>
  <div class="">
    <label class="control-label" v-bind:for="'vehicle_'+attribute">Please enter vehicle {{attribute}}</label>
    <input class="form-control" type="text" ref="input" v-bind:value="value" v-on:input="updateValue($event.target.value)"><br>
    <!-- <span style="color:red">{{ errors.name }}</span> -->
  </div>
</template>

<script>
export default {
  props: {
    vehicleAttribute: {
      type: String
    },
    value: {
      type: String
    }
  },
  data() {
    return {
      attribute: this.vehicleAttribute,
    }
  },
  computed: {

  },
  methods: {
    updateValue: function(value) {
      this.$emit('input', value)
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
