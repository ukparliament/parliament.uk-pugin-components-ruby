const argv    = require('minimist')(process.argv.slice(2)),
      bs      = require('browser-sync').create();

let extraDirs = ['../app/views'];

bs.init({
  proxy: 'localhost:3000',
  files: argv._.concat(extraDirs)
});
