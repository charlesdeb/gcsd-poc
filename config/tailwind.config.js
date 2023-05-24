const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/decorators/**/*.{rb,erb,haml,html,slim}' /** delete this if we really ditch decoarators */,
  ],
  theme: {
    extend: {
      gridTemplateColumns: {
        // timetable time_slots grid
        timetable: '1fr 2fr',
      },
      fontFamily: {
        sans: ['Arimo', ...defaultTheme.fontFamily.sans],
        lora: ['Lora', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        orange: {
          DEFAULT: '#c66c39',
          900: '#622400',
          800: '#943F0E',
          700: '#BD582E' /** header orange */,
          600: '#C66C39' /** body text orange */,
          500: '#CE7949',
          400: '#D58659',
          300: '#DD956B',
          200: '#E5A47E',
          100: '#ECB392',
          50: '#FFFCF5' /** page background orange */,
        },
        gray: {
          500: '#343434',
        },
      },
    },
  },

  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
  ],
};
