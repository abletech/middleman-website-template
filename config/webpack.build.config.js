// Dependencies
const UglifyJSPlugin       = require('uglifyjs-webpack-plugin');
const ExtractTextPlugin    = require('extract-text-webpack-plugin');

// Configuration
const baseConfig  = require('./webpack.base.config');
const PATHS       = require('./paths');
const ENVIRONMENT = require('./environment');
const postCSSConfig = require('./postcss.config');

// Setup
let buildConfig = baseConfig;

buildConfig.output = {
  path: PATHS.DIST_JS,
  filename: '[name].js'
};

buildConfig.module = {
  rules: [
    {
      test: /\.js$/,
      loader: 'babel-loader',
      query: {
        presets: [
          ['es2015', { 'modules': false }]
        ]
      }
    },
    {
      test: /\.css$/,
      use: ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: [
          { // translates CSS into CommonJS
            // See: https://webpack.js.org/loaders/css-loader/
            loader: 'css-loader'
          },
          {
            loader: 'postcss-loader',
            options: postCSSConfig
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
            loader: 'postcss-loader',
            options: postCSSConfig
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

buildConfig.plugins = [

  // Compress output
  new UglifyJSPlugin(),

  // Extracts files from bundles
  new ExtractTextPlugin({
    filename: (path) => {
      return path('js/[name].css').replace('js/', '../css/');
    },
    allChunks: true
  }),
];

module.exports = buildConfig;
