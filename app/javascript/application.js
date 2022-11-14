// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'trix';
import '@rails/actiontext';
// alpine stuff
import Alpine from 'alpinejs';
window.Alpine = Alpine;

// luxon stuff
import { DateTime } from 'luxon';
window.DateTime = DateTime;

