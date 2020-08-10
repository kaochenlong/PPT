import { Controller } from "stimulus"
// import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "heart" ]

  favorite() {
    let board_id = this.data.get("board");

    Rails.ajax({
      url: `/boards/${board_id}/favorite.json`,
      type: 'post',
      success: (result) => {
        if (result["status"] == true) {
          this.heartTarget.classList.remove("far");
          this.heartTarget.classList.add("fas");
        } else {
          this.heartTarget.classList.remove("fas");
          this.heartTarget.classList.add("far");
        }
      },
      error: (err) => {
        console.log(err);
      }
    })
  }
}
