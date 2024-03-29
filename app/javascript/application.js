// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from '@hotwired/turbo-rails';

// The default of 500ms is too long and
// users can lose the causal link between clicking
// a link and seeing the browser respond
Turbo.setProgressBarDelay(100);

import 'controllers';
import 'trix';
import '@rails/actiontext';

import 'alpine-turbo-drive-adapter';
import Alpine from 'alpinejs';
// import focus from '@alpinejs/focus';
// Alpine.plugin(focus);
window.Alpine = Alpine; // only required so that we can see the alpinejs debug tool

// Will not work properly with Turbo - since it is only fired on full-page
// load, and not after turbo does its thing with partial loads
// const eventOfInterest = 'DOMContentLoaded';
const eventOfInterest = 'turbo:load';
window.addEventListener(eventOfInterest, (event) => {
  // console.log(`${eventOfInterest} happened, starting Alpine`);
  /**
   * Pages that use Alpine.store need to be loaded before starting Alpine.
   * Don't call Alpine.start() more than once.
   */
  Alpine.start();
});
