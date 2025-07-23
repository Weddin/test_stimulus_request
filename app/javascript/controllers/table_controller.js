import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "pagination", "pageinfo" ]

  connect() {

  }
  // For preserve this
  update = (data) => {
    const columns = this.element.dataset.columns.split(",");
    const tbody = this.element.tBodies[0];
    tbody.innerHTML = "";
    tbody.innerHTML = data.data.map(item => `<tr>${columns.map(column => `<td onclick="window.location.href='${item.url}'">${item[column]}</td>`).join("")} </tr>`).join("");
    this.pageinfoTarget.innerHTML = data.pagination.info;
    this.paginationTarget.innerHTML = data.pagination.html;
  }
}