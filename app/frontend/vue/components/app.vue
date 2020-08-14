<template>
  <div>
    <h1>{{ message }}</h1>
    <h2>{{ message }}</h2>
    <Ad></Ad>
  </div>
</template>

<script>
import Ad from "vue/components/ui/ad.vue";

export default {
  data: function () {
    return {
      message: "Hello Vue!",
    };
  },
  components: { Ad },
};
</script>

<style scoped>
h1 {
  color: green;
}
</style>
