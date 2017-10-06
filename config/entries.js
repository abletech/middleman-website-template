// Dependencies
const path = require('path');
const PATHS = require('./paths');

// Constants
let entries = {
  // Make sure there are corresponding entries in pacakge.json's `browser` property
  'manifest.main': path.join(PATHS.SOURCE_JS, 'manifest.main.js'),
  'manifest.home': path.join(PATHS.SOURCE_JS, 'manifest.home.js')
  // Add more named entries here. e.g.
  // 'manifest.home': path.join(PATHS.SOURCE_JS, 'manifest.home.js')
  // Don't forget to include them in the relevant Middleman layouts
};

// Return matching files
module.exports = entries;
