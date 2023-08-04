import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="session-type-tabs"
export default class extends Controller {
  connect() {
    //   console.log(this.element);
    //   console.log('hi from session-type-tabs');
    /**
     * This is what is triggered when a recently received turbo frame is
     * rendered.
     */
    // document.addEventListener('turbo:frame-render', (event) => {
    //   console.log('turbo frame-render');
    // });
  }

  /** in mobile view, handle the select element being changed */
  selectChange(event) {
    const sessionType = event.target.value;
    const frameName = sessionType;
    const path = event.target.selectedOptions[0].dataset.path;

    this.loadFrame(frameName, path);

    /**
     * if the user changes the orientation to reveal the tabs, then they
     * should be in sync
     */
    this.highlightTabs(sessionType);

    /** show the correct turbo_frame */
    this.showSummaryContents(sessionType);
  }

  loadFrame(frameName, path) {
    /** get the turbo frame to update (named afer session type) */
    const frame = document.querySelector(`turbo-frame#${frameName}`);

    if (!frame.hasChildNodes()) {
      /** only populate empty turbo-frames */
      frame.src = path;
    }
  }

  tabClick(event) {
    const parentDiv = event.target.closest('[data-session-type]');
    const sessionType = parentDiv.dataset.sessionType;
    const path = parentDiv.dataset.path;

    // console.log({ sessionType, path });

    /**
     * if the user changes the orientation to reveal the select control, then
     * they should be in sync
     */
    document.querySelector('select#session_type').value = sessionType;

    this.showSummaryContents(sessionType);
  }

  highlightTabs(sessionType) {
    // unhighlight all tabs
    document
      .querySelectorAll('nav [data-session-type]')
      .forEach((tabHeader) => {
        tabHeader.classList.replace('text-orange-900', 'text-orange-500');
        tabHeader.classList.remove('hover:text-orange-700');
        tabHeader
          .querySelector('span.inset-x-0')
          .classList.replace('bg-orange-800', 'bg-transparent');
      });

    // highlight tab that was just clicked
    document
      .querySelector(`nav [data-session-type="${sessionType}"]`)
      .classList.replace('text-orange-500', 'text-orange-900');
    document
      .querySelector(`nav [data-session-type="${sessionType}"]`)
      .classList.add('hover:text-orange-700');
    document
      .querySelector(`nav [data-session-type="${sessionType}"] span.inset-x-0`)
      .classList.replace('bg-transparent', 'bg-orange-800');
  }

  showSummaryContents(sessionType) {
    // hide all tab contents
    // @todo can we do this with alpine transitions?
    document
      .querySelectorAll('#session-summaries turbo-frame')
      .forEach((sessionType) => {
        sessionType.classList.add('!hidden');
        sessionType.classList.remove('md:grid');
      });

    // show the selected session_type tab
    // @todo can we do this with alpine transitions?
    document
      .querySelector(`#session-summaries #${sessionType}`)
      .classList.replace('!hidden', 'md:grid');
  }
}
