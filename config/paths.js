// Dependencies
const getPath = require('path');

// Set up our base PATHS object
let PATHS = {
  ROOT        : getPath.resolve(__dirname, './..'),
  TMP         : getPath.resolve(__dirname, './../.tmp'),
  DIST        : getPath.resolve(__dirname, './../.tmp/dist'),
  DIST_CSS    : getPath.resolve(__dirname, './../.tmp/dist/css'),
  DIST_JS     : getPath.resolve(__dirname, './../.tmp/dist/js'),
  BUILD       : getPath.resolve(__dirname, './../build'),
  BUILD_CSS   : getPath.resolve(__dirname, './../build/css'),
  BUILD_JS    : getPath.resolve(__dirname, './../build/js'),
  DATA        : getPath.resolve(__dirname, './../data'),
  SOURCE      : getPath.resolve(__dirname, './../source'),
  SOURCE_CSS  : getPath.resolve(__dirname, './../source/css'),
  SOURCE_JS   : getPath.resolve(__dirname, './../source/js'),
  SOURCE_SCSS : getPath.resolve(__dirname, './../source/scss'),
};

module.exports = PATHS;
