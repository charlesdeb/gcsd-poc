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
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        lora: ['Lora', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        orange: {
          // 100: '#fffcf5',
          // 600: '#c66c39',
          DEFAULT: '#c66c39',
          900: '#622400',
          800: '#943F0E',
          700: '#B75923',
          600: '#C66C39',
          500: '#CE7949',
          400: '#D58659',
          300: '#DD956B',
          200: '#E5A47E',
          100: '#ECB392',
          50: '#F4C3A6',
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
