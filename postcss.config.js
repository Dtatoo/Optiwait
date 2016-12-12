// POSTCSS CONFIG FILE
//

module.exports = {
  plugins: [
    require('postcss-import')({
      path: './web/static/css',
      plugins: [
        require('postcss-url'),
        require('postcss-cssnext'),
        require('autoprefixer')({browsers: ['last 2 versions']})
      ]
    }),
  ]
}
