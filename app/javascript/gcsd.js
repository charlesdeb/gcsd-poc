/** JS functions used in the GCSD  */
const gcsd = {
  // used for setting local cookies - primarily for timeZone
  setCookie: (cookieName, cookieValue, expiryDays) => {
    let date = new Date();
    date.setTime(date.getTime() + expiryDays * 24 * 60 * 60 * 1000);
    const expires = 'expires=' + date.toUTCString();
    document.cookie =
      cookieName + '=' + cookieValue + '; ' + expires + '; path=/';
  },

  getCookie: (cookieName) => {
    const name = cookieName + '=';
    const cDecoded = decodeURIComponent(document.cookie); //to be careful
    const cookieArray = cDecoded.split('; ');
    let res;
    cookieArray.forEach((val) => {
      if (val.indexOf(name) === 0) res = val.substring(name.length);
    });
    return res;
  },
};

export { gcsd };
