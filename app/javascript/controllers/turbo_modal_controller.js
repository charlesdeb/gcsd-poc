import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ['modal', 'content'];
  hideModal() {
    // this.element.parentElement.removeAttribute('src'); // it might be nice to also remove the modal SRC
    // this.element.remove();
    console.log('hiding modal');
    console.log({ window });
    console.log({ document: window.document });

    // Remove the styles that prevent scrolling under a modal added by alpinejs
    // trap, since they don't seem to be being removed on real mobile devices.
    const htmlElement = window.document.querySelector('html');
    htmlElement.style.overflow = '';
    htmlElement.style.paddingRight = '';

    // now remove the entire modal element
    this.modalTarget.remove();
  }

  // hide modal when clicking ESC
  // action: "keyup@window->turbo-modal#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == 'Escape') {
      console.log('escape clicked');
      this.hideModal();
    }
  }

  // hide modal when clicking outside of modal content
  // action: "click@window->turbo-modal#closeBackground"
  closeBackground(e) {
    console.log({ window });
    if (e && this.contentTarget.contains(e.target)) {
      return;
    }

    this.hideModal();
  }
}
