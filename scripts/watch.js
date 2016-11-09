const argv = require('minimist')(process.argv.slice(2)),
      chokidar = require('chokidar'),
      exec = require('child_process').exec,
      log = console.log.bind(console),
      watcher = chokidar.watch(argv._, { ignored: /[\/\\]\./ });

let task;

watcher
  .on('ready', () => log(`Initialised watching for: ${argv._}`))
  .on('change', recompile)
  .on('unlink', recompile)
  .on('error', error => log(`Watcher error: ${error}`))

function recompile(path) {
  const fileExt = path.split('.').pop();
  if(fileExt === 'scss') {
    task = 'make css';
  }
  if(fileExt === 'js') {
    task = 'make js';
  }
  if(task) {
    exec(task, (error, stdout, stderr) => {
      if(error === null && stdout) {
        log(stdout);
      } else {
        log(`Task "${task}" failed:`);
        log(error);
      }
    });
  }
}
