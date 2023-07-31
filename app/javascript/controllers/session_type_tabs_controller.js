import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="session-type-tabs"
export default class extends Controller {
  // connect() {
  //   console.log(this.element);
  //   console.log('hi from session-type-tabs');
  // }
  select(event) {
    const sessionType = event.target.closest('[data-session-type]')?.dataset
      .sessionType;

    // console.log(sessionType);

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

    // hide all tab contents
    // @todo can we do this with alpine transitions
    document
      .querySelectorAll('#session-summaries turbo-frame')
      .forEach((sessionType) => {
        sessionType.classList.add('hidden');
        sessionType.classList.remove('md:grid');
      });

    // show the selected session_type tab
    // @todo can we do this with alpine transitions
    document
      .querySelector(`#session-summaries #${sessionType}`)
      .classList.replace('hidden', 'md:grid');

    return;
  }
}
