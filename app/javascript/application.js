// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from '@hotwired/turbo-rails';

// The default of 500ms is too long and
// users can lose the causal link between clicking
// a link and seeing the browser respond
Turbo.setProgressBarDelay(100);

import 'controllers';
import 'trix';
import '@rails/actiontext';

// alpine stuff
import Alpine from 'alpinejs';
window.Alpine = Alpine; // only required so that we can see the alpinejs debug tool

import { TimeZoneSelect } from './lib/timezone_select';
TimeZoneSelect.start(window);

window.addEventListener('turbo:load', (event) => {
  /** Pages that use Alpine.store need to be loaded before starting Alpine,
   * but should already have been started by TimeZoneSelect.start(), so this is
   * probably not needed */
  Alpine.start();
});

// luxon stuff - now in timezone_select.js since that is where it is used
// import { DateTime } from 'luxon';
// window.DateTime = DateTime;
