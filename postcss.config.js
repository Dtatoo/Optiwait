// POSTCSS CONFIG FILE
//

module.exports = {
  plugins: [
    require('postcss-import')({
      path: './web/static/css',
      plugins: [
        require('autoprefixer'),
        require('postcss-url'),
        require('postcss-cssnext'),
      ]
    }),
  ]
}
