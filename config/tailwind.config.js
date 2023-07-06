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
      // Basics
      white: "#fff",
      black: "#000",

      // Default text
      "text-100": "#000000",
      "text-200": "#414552",
      "text-300": "#3c4257",
      "text-300": "#3c4257",
      "text-400": "#9ea1ab",

      // App colors
      "blue-100": "#008cdd",
      "green-100": "#008000",
      "purple-100": "#673ab7",
      "gray-100": "#e5e5e5",
      "red-100": "#cc3446",
      "red-200": "rgb(249, 226, 221)",
      "indigo-100": "rgb(99, 91, 255)",
      "slate-100": "#2c3e50",
      
      // primaryText: "rgb(50, 50, 90)",
      // primaryBlue: "#4d68ad",
      // primaryRed: "#f76b8a",
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
      gridTemplateRows: {
        'verseComponentGrid': '1fr 0.6fr',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
