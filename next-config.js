const withPwa = require('next-pwa')

module.exports = withPWA({
    pwa: {
        dest: 'public'
    },
    future: {
        webpack5: true
      }
})