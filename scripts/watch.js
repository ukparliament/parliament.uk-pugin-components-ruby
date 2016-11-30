// const argv     = require('minimist')(process.argv.slice(2)),
//       chokidar = require('chokidar'),
//       exec     = require('child_process').exec,
//       log      = console.log.bind(console),
//       pathn    = require('path'),
//       pugin    = require('../../pugin.json');

// let keyCount = Object.keys(pugin).length;
// let task;
// let watcher;

// var directoriesToWatch = [];
// for(k in pugin) {
//   keyCount = keyCount - 1;
//   directoriesToWatch = directoriesToWatch.concat(pugin[k]);
//   if(keyCount === 0) {
//     initialise(directoriesToWatch);
//   }
// }

// function initialise(directoriesToWatch) {
//   watcher = chokidar.watch(directoriesToWatch, { ignored: /[\/\\]\./ });
// }

// function getTaskByDirectory(directory, path) {
//   console.log(directory, path);
// }

// function test(path) {
//   console.log(path);
// }

watcher
  .on('ready', () => log('Watching files...'))
  .on('error', error => log(`Watcher error: ${error}`))
  .on('addDir', test)
  // .on('addDir', path => log(`Has been added: ${pathn.resolve(__dirname, `${path}`)}`))
  .on('change', path => log(`Changed: ${path}`));
  // .on('change', recompile)
  // .on('unlink', recompile)

// // function recompile(path) {
// //   const fileExt = path.split('.').pop();
// //   if(fileExt === 'scss') {
// //     task = 'make loader TASK=css';
// //   }
// //   if(task) {
// //     exec(task, (error, stdout, stderr) => {
// //       if(error === null && stdout) {
// //         log(stdout);
// //       } else {
// //         log(`Task "${task}" failed:`);
// //         log(error);
// //       }
// //     });
// //   }
// // }
