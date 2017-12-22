const { environment } = require('@rails/webpacker')

// const cssPlugins = require('./postcssrc.yml').plugins

environment.loaders.append('vue', {
  test: /\.vue$/,
  use: [{
    loader: 'vue-loader',
  }]
})


module.exports = environment
