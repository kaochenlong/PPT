import { Controller } from "stimulus"
import ax from "axios";

export default class extends Controller {
  static targets = [ "heart" ]

  favorite() {
    let board_id = this.data.get("board");

    const token = document.querySelector("meta[name=csrf-token]").content;
    ax.defaults.headers.common['X-CSRF-Token'] = token;

    ax.post(`/boards/${board_id}/favorite.json`)
      .then((result) => {
        if (result.data["status"] == true) {
          this.heartTarget.classList.remove("far");
          this.heartTarget.classList.add("fas");
        } else {
          this.heartTarget.classList.remove("fas");
          this.heartTarget.classList.add("far");
        }
      })
      .catch(function(err) {
        console.log(err);
      })
  }
}
