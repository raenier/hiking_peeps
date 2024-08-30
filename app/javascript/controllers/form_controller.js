import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    this.element.reset()
    this.element.querySelectorAll("input:not([type='submit']), textarea").forEach(input => input.value = "")
    this.element.querySelector(".errors").innerHTML = ""
    this.element.querySelector(".errors").style.display = "none"
    this.element.querySelectorAll(".field_with_errors").forEach(field => field.classList.remove("field_with_errors"))
  }

  checkSize(event) {
    if (event.target.files[0].size > 10485760) {
      event.target.value = ""
      alert("File is too big! Upload only 10MB or less.");
    }
  }
}
