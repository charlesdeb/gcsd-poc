// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'trix';
import '@rails/actiontext';
// import { gcsd } from 'gcsd';
import 'gcsd';

// alpine stuff
import Alpine from 'alpinejs';
window.Alpine = Alpine; // only required so that we can see the alpinejs debug tool

window.addEventListener('load', (event) => {
  /** Pages, that use Alpine.store need to be loaded before starting Alpine */
  /** @todo this may need revising - since we don't want to depend on 3rd
   * party sites to load before ours becomes fully functional */
  Alpine.start();
});

// luxon stuff - now in timezone_select.js since that is where it is used
// import { DateTime } from 'luxon';
// window.DateTime = DateTime;
