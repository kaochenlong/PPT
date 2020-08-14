import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'title' ]

  something(e) {
    this.titleTarget.textContent = "";
    console.log(e.detail["hazcheeseburger"]);
  }
}
