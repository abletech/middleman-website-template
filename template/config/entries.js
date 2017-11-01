// Dependencies
const path = require('path');
const PATHS = require('./paths');

// Constants
let entries = {
  // JS
  // ======================
  // Make sure there are corresponding entries in pacakge.json's `browser` property
  'script.main': path.join(PATHS.SOURCE_JS, 'script.main.js'),
  'script.home': path.join(PATHS.SOURCE_JS, 'script.home.js'),
  // Add more named entries here. e.g.
  // 'script.about': path.join(PATHS.SOURCE_JS, 'script.about.js')
  // Don't forget to include them in the relevant Middleman layouts
  //
  // SCSS
  // ======================
  'style.main': path.join(PATHS.SOURCE_SCSS, 'style.main.css.scss'),
  'style.home': path.join(PATHS.SOURCE_SCSS, 'style.home.css.scss')
  // Add more named entries here. e.g.
  // 'style.about': path.join(PATHS.SOURCE_SCSS, 'style.about.js')
  // Don't forget to include them in the relevant Middleman layouts
  //
};

// Return matching files
module.exports = entries;
