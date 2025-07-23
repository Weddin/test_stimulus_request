module.exports = {
  content: [
    './app/views/**/*.slim',
    './app/views/**/*.erb',
    './app/components/**/*.slim',
    './app/components/**/*.erb',
    '../app/components/**/*.erb',
    './app/components/**/*.rb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      maxHeight: {
        '96': '24rem',
      }
    }
  }
};
