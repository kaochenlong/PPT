import { Controller } from "stimulus"
// import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "heart" ]

  favorite() {
    // 發出事件
    const event = new CustomEvent("cat", {
      detail: {
        hazcheeseburger: 123
      }
    });
    window.dispatchEvent(event);
  }
}
