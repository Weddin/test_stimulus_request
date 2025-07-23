import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// This is just example of json request/render. Usually you should use Turbo Streams
export default class extends Controller {
  static outlets = ["table"]
  connect() {
    this.element.addEventListener("submit", this.handleSubmit);
  }
  disconnect() {
    this.element.removeEventListener("submit", this.handleSubmit);
  }

  handleSubmit = (event) => {
    event.preventDefault();

    const formData = new FormData(this.element);
    const qs = new URLSearchParams(formData);
    qs.append("format", "json");
    const url = this.element.action + `?` + qs;

    // This is just example of json request/response. if TurboStream - we don't need to write `then` handler
    get(url, {
      headers: {
        "Content-Type": "application/json"
      }
    }).then(response => {
      if (response.ok) {
        this.tableOutlets.forEach(table =>
          response.json.then(table.update)
        );
      } else {
        Turbo.visit(response.url);
      }
    })
  }
}