const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const path = require('path');

// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: path.resolve(path.join(__dirname, '../../node_modules', 'jquery')),
    Popper: ['popper.js', 'default']
  })
)

environment.loaders.prepend('erb', erb)
module.exports = environment
