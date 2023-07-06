const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    colors: {
      white: "#fff",
      black: "#000",
      // primaryBlue: "#4d68ad",
      primaryBlue: "#008cdd",
      // primaryRed: "#f76b8a",
      primaryRed: "rgb(154, 64, 93)",
      secondaryRed: "rgb(249, 226, 221)",
      textHeader: "#000000",
      textSubheader: "#414552",
      textParagraph: "#3c4257",
      
      blue1: '#4a55a2',
      blue2: '#7895cb',
      blue3: '#a0bfe0',
      blue4: '#c5dff8',
      red: '#e63946',
      "indigo-600": "#4a55a2",

    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
