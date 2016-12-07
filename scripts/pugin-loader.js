const argv  = require('minimist')(process.argv.slice(2)),
      fs    = require('fs'),
      exec  = require('child_process').exec,
      pugin = require('../../pugin.json'),
      path  = require('path');

let count = Object.keys(pugin).length;

for (const k in pugin) {
  if(argv.task && argv.task !== k) {
    count = count - 1;
    delete pugin[k];
  }
  if(pugin.hasOwnProperty(k)) {
    count = count - 1;
    for (let i = 0; i < pugin[k].length; i++) {
      const wholepath = path.resolve(__dirname, `../../${pugin[k][i]}`);
      if (fs.lstatSync(wholepath).isFile()) {
        pugin[k][i] = wholepath;
      }
      if (fs.lstatSync(wholepath).isDirectory()) {
        pugin[k][i] = `${wholepath}/.`;
      }
    }
  }
  if(count === 0) {
    call();
  }
}

function call() {
  if(!argv.env && typeof pugin.js !== 'undefined') {
    const lintFolders = [];
    for (let a = pugin.js.length - 1; a >= 0; a--) {
      if(pugin.js[a].substring(pugin.js[a].length - 2) == '/.') {
        lintFolders.push(`${pugin.js[a].slice(0, -2)}/**/*`);
      } else {
        lintFolders.push(`${pugin.js[a]}/**/*`);
      }
    }
    exec(`make js_lint GET_FROM=${lintFolders}`, (error, stdout, stderr) => {
      if (error) {
        console.log('Error:', error);
      }
      if (stdout) {
        console.log(stdout);
      }
      if (stderr) {
        console.log('Stderr:', stderr);
      }
    });
  }
  for (const task in pugin) {
    if(pugin[task].length) {
      exec(`make ${task} GET_FROM=${pugin[task]}`, (error, stdout, stderr) => {
        if (error) {
          console.log('Error:', error);
        }
        if (stdout) {
          console.log(stdout);
        }
        if (stderr) {
          console.log('Stderr:', stderr);
        }
      });
    }
  }
}
