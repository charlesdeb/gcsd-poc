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

// luxon stuff - now in timezone_select.js since that is where it is used
// import { DateTime } from 'luxon';
// window.DateTime = DateTime;
