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
        sans: ['Mulish', ...defaultTheme.fontFamily.sans],
        lora: ['Lora', ...defaultTheme.fontFamily.sans],
        montserrat: ['Montserrat', ...defaultTheme.fontFamily.sans],
        philosopher: ['Philosopher', ...defaultTheme.fontFamily.sans],
        mulish: ['Mulish', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        // https://uicolors.app/edit?sv1=celery:50-f9faf0/100-edefd6/200-d8ddaa/300-c7cc7d/400-bcbe5a/500-b5ae4b/600-9f8f40/700-857038/800-6e5b32/900-5b4b2c/950-332815;skyblue:50-f2f9fd/100-e5f1f9/200-c4e2f3/300-91cae8/400-6cb9df/500-3095c7/600-2177a8/700-1c6088/800-1b5171/900-1b445f/950-122c3f;orange:50-fff6ed/100-feead6/200-fcd1ac/300-f9b078/400-f68541/500-f4712f/600-e44a12/700-bd3611/800-962c16/900-792715/950-411109
        celery: {
          DEFAULT: '#bcbe5a' /** Kez's base green */,
          50: '#f9faf0',
          100: '#edefd6',
          200: '#d8ddaa',
          300: '#c7cc7d',
          400: '#bcbe5a',
          500: '#b5ae4b',
          600: '#9f8f40',
          700: '#857038',
          800: '#6e5b32',
          900: '#5b4b2c',
          950: '#332815',
        },

        orange: {
          DEFAULT: '#f4712f',
          50: '#fff6ed',
          100: '#feead6',
          200: '#fcd1ac',
          300: '#f9b078',
          400: '#f68541',
          500: '#f4712f' /** Kez's base orange */,
          600: '#e44a12' /** body text orange */,
          700: '#bd3611' /** header orange */,
          800: '#962c16',
          900: '#792715',
          950: '#411109',
        },

        skyblue: {
          DEFAULT: '#6cb9df' /** Kez's base blue */,
          50: '#f2f9fd',
          100: '#e5f1f9',
          200: '#c4e2f3',
          300: '#91cae8',
          400: '#6cb9df',
          500: '#3095c7',
          600: '#2177a8',
          700: '#1c6088',
          800: '#1b5171',
          900: '#1b445f',
          950: '#122c3f',
        },

        pageBg: {
          DEFAULT: '#f6f4ee' /** Kez's colour */,
        },

        gray: {
          // 500: '#343434', /** original gray */
          500: '#112436' /** Kez's colour */,
        },
      },
    },
  },

  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
};
