import { Controller } from "stimulus"

export default class extends Controller {

  static targets = [
    'right', 'left',
    'altRight', 'altLeft',
    'shiftRight', 'shiftLeft',
    'period'
  ]

  connect() {}

  navigate(event) {
    if (event.target != this.element) return

    if (event.key == 'ArrowRight') {
      if (event.altKey) this.altRightTarget.click()
      else if (event.shiftKey) this.shiftRightTarget.click()
      else this.rightTarget.click()
    }

    if (event.key == 'ArrowLeft') {
      if (event.altKey) this.altLeftTarget.click()
      else if (event.shiftKey) this.shiftLeftTarget.click()
      else this.leftTarget.click()
    }
    
    if (event.key == '.') {
      this.periodTarget.click()
    }
  }
}
