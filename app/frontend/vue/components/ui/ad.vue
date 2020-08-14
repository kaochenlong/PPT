<template>
  <div>
    <h2>{{ title }}</h2>
    <p>{{ content }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      title: "廣告標題",
      content: "內文內文內文內文內文內文內文內文內文內文內文內文",
    };
  },
};
</script>

<style scoped>
div {
  border-color: white;
  border-width: 2px;
  border-style: solid;
  border-radius: 4px;
}
</style>