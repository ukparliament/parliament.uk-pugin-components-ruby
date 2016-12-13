const argv    = require('minimist')(process.argv.slice(2)),
      fs      = require('fs'),
      glob    = require('glob'),
      svg2png = require('svg2png');

function processImage(filePath) {
  fs.readFile(filePath, (error, data) => {
    console.log(`Generating PNG from SVG located in: ${filePath}`);
    svg2png(data, { width: 300 })
      .then(buffer => fs.writeFile(`${filePath}.png`, buffer))
      .catch(e => console.error(e));
  });
}

function pngify(error, files) {
  for (let i = files.length - 1; i >= 0; i--) {
    processImage(files[i]);
  }
}

function init(directory) {
  glob(`${directory}/**/*.svg`, {}, pngify);
}

init(argv.directory);
