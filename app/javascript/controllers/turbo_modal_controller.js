import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  // some code taken from https://www.bearer.com/blog/how-to-build-modals-with-hotwire-turbo-frames-stimulusjs
  static targets = ['modal', 'content'];

  connect() {
    // when the modal is showing, don't allow background scrolling
    this.setBackgroundScoll(false);
  }

  // I was using x-trap with Alpine, but it was getting mixed up with Stimulus.
  // TODO: refactor the modal so that it works properly with Alpine
  setBackgroundScoll(isAllowScroll = true) {
    const htmlElement = window.document.querySelector('html');
    if (isAllowScroll) {
      htmlElement.style.overflow = '';
      htmlElement.style.paddingRight = '';
    } else {
      htmlElement.style.overflow = 'hidden';
      htmlElement.style.paddingRight = '0px';
    }
  }

  hideModal() {
    // When the modal is gone, reinstate background scrolling
    this.setBackgroundScoll(true);

    // Remove the entire modal element
    this.modalTarget.remove();
  }

  // hide modal when clicking ESC
  // action: "keyup@window->turbo-modal#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == 'Escape') {
      this.hideModal();
    }
  }

  // hide modal when clicking outside of modal content
  // action: "click@window->turbo-modal#closeBackground"
  closeBackground(e) {
    if (e && this.contentTarget.contains(e.target)) {
      return;
    }

    this.hideModal();
  }
}
