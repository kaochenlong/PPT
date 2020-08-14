import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Board from 'vue/components/board.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  let el = document.querySelector("#board");

  if (el) {
    new Vue({
      el,
      components: { Board }
    })
  }
})