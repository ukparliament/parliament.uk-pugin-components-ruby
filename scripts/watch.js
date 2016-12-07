const argv     = require('minimist')(process.argv.slice(2)),
      chokidar = require('chokidar'),
      exec     = require('child_process').exec,
      path     = require('path'),
      pugin    = require('../../pugin.json');

let keyCount = Object.keys(pugin).length,
    task,
    watcher;

const directoriesToWatch = [];
for(k in pugin) {
  for (let i = 0; i < pugin[k].length; i++) {
    directoriesToWatch.push(path.resolve(__dirname, `../../${pugin[k][i]}`));
  }
  keyCount = keyCount - 1;
  if(keyCount === 0) {
    initialise(directoriesToWatch);
  }
}

function initialise(directoriesToWatch) {
  watcher = chokidar.watch(directoriesToWatch, { ignored: /[\/\\]\./ });
}

watcher
  .on('ready', () => console.log('Watching files...'))
  .on('error', error => console.log(`Watcher error: ${error}`))
  .on('addDir', path => console.log(`Has been added: ${path}`))
  .on('change', recompile)
  .on('unlink', recompile);

function recompile(path) {
  console.log('File changed:', path);
  task = 'make build TASK=';
  for(k in pugin) {
    for (let normalised of pugin[k]) {
      if(normalised.startsWith('./')) {
        normalised = normalised.substring(2);
      }
      if(path.includes(normalised)) {
        task = task + k;
        exec(task, (error, stdout, stderr) => {
          if(error === null && stdout) {
            console.log(stdout);
          } else {
            console.log(`Task "${task}" failed:`);
            console.log(error);
          }
        });
      }
    }
  }
}
