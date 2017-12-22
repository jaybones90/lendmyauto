const environment = require('./environment')


environment.loaders.insert('eslint', {
  enforce: "pre",
  test: /\.vue$/,
  exclude: /node_modules/,
  use: [{
    loader: 'eslint-loader'
  }],
}, { after: 'babel' }
)

module.exports = environment.toWebpackConfig()
