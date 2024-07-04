import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]


  showModal() {
    this.modalTarget.classList.remove("hidden")
  }

  hideModal() {
    this.modalTarget.classList.add("hidden")
  }

  hideModalEscape(event) {
    if(event.code == "Escape") this.hideModal()
  }
}
