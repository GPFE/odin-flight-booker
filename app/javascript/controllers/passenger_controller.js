import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  static values = { id: { type: Number, default: 0 } }

  add(event) {
    event.preventDefault()

    const template = this.formTarget.content.cloneNode(true)

    const container = this.element.querySelector("#passenger-forms")
    container.appendChild(template)
  }
}
