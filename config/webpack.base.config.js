// Dependencies
const PATHS = require('./paths');

// Confuguration
const ENTRIES = require('./entries');

// Set up base config
let config = {
  context: PATHS.SOURCE,
  entry: ENTRIES
};

module.exports = config;
