const argv             = require('minimist')(process.argv.slice(2)),
      autoprefixer     = require('autoprefixer'),
      cssnano          = require('cssnano'),
      fs               = require('fs'),
      glob             = require('glob'),
      mqpacker         = require('css-mqpacker'),
      postcss          = require('postcss'),
      pxtorem          = require('postcss-pxtorem'),

      autoprefixerOpts = {
        browsers: [
          'last 2 version',
          '> 1%',
          'ie >= 9',
          'ie_mob >= 10',
          'ff >= 30',
          'chrome >= 34',
          'safari >= 7',
          'opera >= 23',
          'ios >= 7',
          'android >= 4',
          'bb >= 10'
        ]
      },

      cssnanoOpts      = {
        zindex: false,
        discardUnused: false,
        autoprefixer: false,
        discardComments: {
            removeAll: true
        }
      },

      pxtoremOpts      = {
        replace: false,
        mediaQuery: false
      },

      processor        = postcss([
        autoprefixer(autoprefixerOpts),
        pxtorem(pxtoremOpts),
        mqpacker(),
        cssnano(cssnanoOpts)
      ]);

function init(directory) {
  glob(`${directory}.css`, {}, render);
}

function processCss(filePath) {
  fs.readFile(filePath, (error, data) => {
    processor.process(data, { from: filePath, to: filePath, map: { inline: false } })
      .then(result => {
        fs.writeFileSync(filePath, result.css);
        if ( result.map ) fs.writeFileSync(`${filePath}.map`, result.map);
      }, error => {
        console.warn('Error!', error);
      });
  });
}

function render(error, files) {
  for (let i = files.length - 1; i >= 0; i--) {
    processCss(files[i]);
  }
}

init(argv.directory);
