import {Controller} from "stimulus"
import {enter, leave} from 'el-transition';

export default class extends Controller {
  static targets = ["menu", "button"]

  toggleMenu(event) {
    event.stopPropagation();
    if (this.menuTarget.classList.contains('hidden')) {
      document.body.addEventListener('click', event => this.closeMenu(event));
      enter(this.menuTarget)
    } else {
      this.closeMenu(event);
    }
  }

  closeMenu(event){
    document.body.removeEventListener('click', event => this.closeMenu(event));
    leave(this.menuTarget)
  }
}