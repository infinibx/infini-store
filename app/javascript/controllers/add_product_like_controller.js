import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-product-like"
export default class extends Controller {

  connect() {
    alert('Hello from Stimulus')
  }
}
