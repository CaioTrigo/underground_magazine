import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "btn" ]

  connect() {
    console.log("conectou")
    console.log(this.btnTarget)
  }
}
