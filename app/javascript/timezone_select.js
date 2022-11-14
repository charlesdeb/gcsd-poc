window.addEventListener('load', (event) => {
  if (typeof gcsd == 'undefined') {
    window.gcsd = {};
  }

  gcsd.setCookie = function (cookieName, cookieValue, expiryDays) {
    let date = new Date();
    date.setTime(date.getTime() + expiryDays * 24 * 60 * 60 * 1000);
    const expires = 'expires=' + date.toUTCString();
    document.cookie =
      cookieName + '=' + cookieValue + '; ' + expires + '; path=/';
  };

  gcsd.getCookie = function (cookieName) {
    const name = cookieName + '=';
    const cDecoded = decodeURIComponent(document.cookie); //to be careful
    const cookieArray = cDecoded.split('; ');
    let res;
    cookieArray.forEach((val) => {
      if (val.indexOf(name) === 0) res = val.substring(name.length);
    });
    return res;
  };

  Alpine.store('timeZoneSelect', {
    state: {
      defaultTimeZone: 'Europe/London',
    },
    init() {
      // Set up locale
      const htmlLocale =
        document.querySelector('HTML').attributes['lang'].value;

      this.state.locale = htmlLocale;

      // set timezone from a client cookie (if it exists and is valid)
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

  Alpine.start();
});
