// Dependencies
const path = require('path');
const PATHS = require('./paths');

// Constants
let entries = {
  main: path.join(PATHS.SOURCE_JS, 'manifest.main.js')
  // Add more named entries here. e.g.
  // page_home: path.join(PATHS.JS, 'manifest.home.js')
  // Don't forget to include them in the relevant Middleman layouts
};

// Return matching files
module.exports = entries;
