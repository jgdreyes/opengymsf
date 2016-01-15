// Import some Broccoli plugins
var compileSass = require('broccoli-sass');
var filterCoffeeScript = require('broccoli-coffee');
var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-funnel');

// Specify the Sass and Coffeescript directories
var sassDir = 'app/assets/scss';
var coffeeDir = 'app/assets/coffee';

// Tell Broccoli how we want the assets to be compiled
var styles = compileSass([sassDir], 'app.scss', 'app.css');
var scripts = filterCoffeeScript(coffeeDir);

var stylesheets = new pickFiles(styles, { destDir: 'assets/stylesheets'} )
var javascripts = new pickFiles(scripts, { destDir: 'assets/javascripts'} )


// Merge the compiled styles and scripts into one output directory.
module.exports = mergeTrees([stylesheets, javascripts]);






