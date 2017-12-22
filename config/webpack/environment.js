const { environment } = require('@rails/webpacker')

// const cssPlugins = require('./postcssrc.yml').plugins

environment.loaders.insert('vue', {
  test: /\.vue$/,
  use: [{
    loader: 'vue-loader'
  }]
}, { after: 'eslint'}
)



module.exports = environment
