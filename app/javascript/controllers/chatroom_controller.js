import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "user" ]

  connect() {
    this.markActiveUser();
  }

  markActiveUser() {
    this.userTargets.forEach((user) => {
      if (user.href === window.location.href) {
        user.classList.add('active');
      }
      else {
        user.classList.remove('active');
      }
    })
  }

}
