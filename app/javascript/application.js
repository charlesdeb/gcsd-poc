// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from '@hotwired/turbo-rails';

// The default of 500ms is too long and
// users can lose the causal link between clicking
// a link and seeing the browser respond
Turbo.setProgressBarDelay(100);

import 'controllers';
import 'trix';
import '@rails/actiontext';

import Alpine from 'alpinejs';
window.Alpine = Alpine; // only required so that we can see the alpinejs debug tool

window.addEventListener('turbo:load', (event) => {
  /** 
   * Pages that use Alpine.store need to be loaded before starting Alpine. 
   * Don't called Alpine.start() more than once.
   */
  Alpine.start();
});
