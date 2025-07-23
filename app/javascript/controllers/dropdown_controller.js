import Dropdown from "@stimulus-components/dropdown"
import { useClickOutside, useDebounce } from "stimulus-use"
import {post} from "@rails/request.js"

export default class extends Dropdown {
  static targets = ["input", "item", "search"]
  static debounces = [{
    name: 'remoteSearchDebounce',
    wait: 500
  }]

  #loadingHtml = `<div class="py-4">
    <div class="text-muted-foreground text-center">Loading...</div>
  </div>`

  connect() {
    super.connect()

    useDebounce(this)
    useClickOutside(this)
  }
  itemTargetConnected(element) {
    if (element.innerText.trim() == this.searchTarget.value) {
      element.click();
    }
  }

  searchTargetConnected(element) {
    this._selected = element.value
  }
  returnSelected(event) {
    this.searchTarget.value = this._selected
  }
  clickOutside(event) {
    this.hide(event)
  }
  down(event) {
    const pressedItem = this.itemTargets.find(element => element.getAttribute("aria-selected") == "true")
    const pressed = this.itemTargets.indexOf(pressedItem)
    const nextItem = this.itemTargets[pressed + 1]

    if (nextItem) {
      nextItem.click();
    }
  }
  selectCurrent(e) {
    this.remoteSearch()
  }
  up(event) {
    const pressedItem = this.itemTargets.find(element => element.getAttribute("aria-selected") == "true")
    const pressed = this.itemTargets.indexOf(pressedItem)
    const nextItem = this.itemTargets[pressed - 1]

    if (nextItem) {
      nextItem.click();
    }
  }
  search() {
    for (let element of this.itemTargets) {
      if (element.innerText.trim() == this.searchTarget.value) {
        element.click();
      } else {
        element.removeAttribute("aria-selected");
      }
    }

    this.remoteSearch();
  }

  remoteSearch() {
    this.menuTarget.innerHTML = this.#loadingHtml;
    this.remoteSearchDebounce();
  }
  remoteSearchDebounce() {
    post(this.element.dataset.action, {
      headers: {
        'Accept': 'text/vnd.turbo-stream.html, text/html'
      },
      body: JSON.stringify({
        search: this.searchTarget.value
      })
    })
  }
  select({ params }) {
    this.searchTarget.value = params.name
    this.inputTarget.value = params.id
    this._selected = params.name

    for (let element of this.itemTargets) {
      if (element.innerText.trim() == this.searchTarget.value) {
        element.setAttribute("aria-selected", 'true');

      } else {
        element.removeAttribute("aria-selected");
      }
    }
  }
}