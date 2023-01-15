/** Functionality for the timezone_select picker */

import Alpine from 'alpinejs';
import { gcsd } from './gcsd';
import { DateTime } from 'luxon';

const start = function (window) {
  const document = window.document;

  /**
   * Create an Alpine store so that the timezone data can be referenced across
   * the entire page
   */
  Alpine.store('timeZoneSelect', {
    state: {
      defaultTimeZone: 'Europe/London',
    },
    init() {
      // Grab page locale; we'll need it for date formatting
      const htmlLocale =
        document.querySelector('HTML').attributes['lang'].value;

      this.state.locale = htmlLocale;

      // Set timezone from a client cookie (if it exists and is valid)
      const gcsd_timezone = gcsd.getCookie('gcsd_timezone');
      const timeZoneSelect = document.querySelector('select#time-zone');
      const validTimeZones = [...timeZoneSelect.options].map((option) => {
        return option.value;
      });

      this.state.timeZone = validTimeZones.includes(gcsd_timezone)
        ? gcsd_timezone
        : this.state.defaultTimeZone;

      // ensure the timezone dropdown has the correct item selected
      timeZoneSelect.value = this.state.timeZone;

      // If we had a duff timeZone cookie, then reset it
      if (!validTimeZones.includes(gcsd_timezone)) {
        this.updateTimeZone(this.state.timeZone);
      }
    },
    updateTimeZone(timeZone) {
      this.state.timeZone = timeZone;
      gcsd.setCookie('gcsd_timezone', this.state.timeZone, 30);
    },
    formatDateTime(dateTime) {
      return DateTime.fromISO(dateTime)
        .setLocale(this.state.locale)
        .setZone(this.state.timeZone)
        .toLocaleString({ ...DateTime.DATETIME_MED, weekday: 'long' });
    },
  });

  /** Start Alpine once everything has loaded */
  window.addEventListener('turbo:load', (event) => {
    Alpine.start();
  });
};

export const TimeZoneSelect = {
  start: start,
};
