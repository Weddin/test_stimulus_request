// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import TurboPower from 'turbo_power'
TurboPower.initialize(Turbo.StreamActions)

Turbo.setConfirmMethod(async (message, formElement, submitter) => {
  let dialog = document.getElementById('turbo-confirm').cloneNode(true)
  document.body.appendChild(dialog)
  if (message) {
    dialog.querySelector('[data-js="dialog-message"]').innerText = message
  }
  dialog.showModal();

  return new Promise((resolve) => {
    dialog.addEventListener("close", () => {
      if (dialog.returnValue == 'confirm') {
        resolve(true)
      } else {
        resolve(false)
      }
      dialog.remove();
    }, { once: true })
  })
})