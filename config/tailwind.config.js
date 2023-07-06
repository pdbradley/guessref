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
      primaryText: "rgb(50, 50, 90)",
      primaryBlue: "#008cdd",
      primaryRed: "rgb(204, 52, 70)",
      secondaryRed: "rgb(249, 226, 221)",
      
      // primaryBlue: "#4d68ad",
      // primaryRed: "#f76b8a",
      textHeader: "#000000",
      textSubheader: "#414552",
      textParagraph: "#3c4257",


      primaryIndigo: "rgb(99, 91, 255)",
      
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
