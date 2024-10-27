import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toast"]
  connect() {
    console.log("Toast controller connected", this.toastTarget)
    setTimeout(() => {
      this.toastTarget.classList.add("d-none")
    }, 2000)
  }
}
