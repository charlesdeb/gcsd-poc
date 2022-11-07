const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/decorators/**/*.{rb,erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        lora: ['Lora', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        orange: {
          100: '#fffcf5',
          600: '#c66c39',
          DEFAULT: '#c66c39',
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
