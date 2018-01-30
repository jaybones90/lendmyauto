<template>
  <div>
    <div v-for="feature in features" class="form-check form-check-inline">
      <input type="checkbox" v-bind:value="feature.id" v-model="checkedFeatures" v-on:change="updateParentCheckboxes(checkedFeatures)">
      <label>{{feature.description}}</label>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    vehicleFeatures: {
      type: Array
    },
    value: {
      type: String
    },
    errorsFromParent: {
      type: Object
    }
  },
  data() {
    return {
      attribute: this.vehicleAttribute,
      features: this.vehicleFeatures,
      checkedFeatures: []
    }
  },
  computed: {
    errors: function() {
      return this.errorsFromParent
    }
  },
  methods: {
    updateParentCheckboxes: function(features) {
      this.$emit('updateCheckboxes', features)
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
