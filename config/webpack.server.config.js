// Dependencies
const webpack              = require('webpack');
const ExtractTextPlugin    = require('extract-text-webpack-plugin');
const NameAllModulesPlugin = require('name-all-modules-plugin');

// Configuration
const baseConfig = require('./webpack.base.config');
const PATHS = require('./paths');
const ENVIRONMENT = require('./environment');

// Start off with the baseConfig
let serverConfig = baseConfig;

// Then extend the baseConfig
serverConfig.devServer = {
  contentBase: PATHS.BUILD,
  hot: true
};

serverConfig.devtool = 'inline-source-map';

serverConfig.module = {
  rules: [
    {
      test: /\.css$/,
      use: ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: [
          { // Creates style nodes from JS strings
            // See: https://webpack.js.org/loaders/style-loader/
            loader: 'style-loader'
          },
          { // translates CSS into CommonJS
            // See: https://webpack.js.org/loaders/css-loader/
            loader: 'css-loader'
          },
          {
            // Resolves url() paths in SCSS files
            // See: https://github.com/bholloway/resolve-url-loader
            loader: 'resolve-url-loader'
          }
        ]
      })
    },
    {
      test: /\.scss$/,
      use: ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: [
          { // translates CSS into CommonJS
            // See: https://webpack.js.org/loaders/css-loader/
            loader: 'css-loader'
          },
          {
            // Resolves url() paths in SCSS files
            // See: https://github.com/bholloway/resolve-url-loader
            loader: 'resolve-url-loader'
          },
          { // compiles Sass to CSS
            // See: https://webpack.js.org/loaders/sass-loader/
            loader: 'sass-loader',
            options: { // See: https://github.com/sass/node-sass
              data: '$env: ' + ENVIRONMENT + ';'
            }
          }
        ]
      })
    }
  ]
};

serverConfig.output = {
  path: PATHS.DIST_JS,
  filename: 'js/[name].js'
};

serverConfig.plugins = [

  // Output the name of modules during HMR/Dev
  // See: https://webpack.js.org/plugins/named-modules-plugin/
  new webpack.NamedModulesPlugin(),

  // Gives each module a name for good caching
  new NameAllModulesPlugin(),

  new ExtractTextPlugin({
    filename: (path) => {
      return path('css/[name].css').replace('css/js', 'css');
    },
    allChunks: true
  }),
  new webpack.HotModuleReplacementPlugin()
];

module.exports = serverConfig;
