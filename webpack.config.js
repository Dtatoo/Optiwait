const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

function join(dest) {
  return path.resolve(__dirname, dest);
}

const elmSource = join('web/elm');
const javascriptMain = join('web/static/js/app.js');

module.exports = {
  entry: [
    javascriptMain
  ],
  output: {
    path: join('priv/static'),
    filename: 'js/app.js'
  },
  module: {
    noParse: [/\.elm/],
    rules: [
      {
        test: /\.elm/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: `elm-webpack-loader?verbose=true&warn=true&debug=true&cwd=${elmSource}`
      },
      {
        test: /\.js/,
        include: join('web/static/js'),
        loader: 'babel-loader'
      },
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        loader: 'file-loader'
      },
      {
        test: /\.css/,
        include: join('web/static/css'),
        loader: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          loader: [
            'css-loader?importLoaders=1',
            'postcss-loader'
          ]
        })
      }
    ]
  },
  devtool: 'source-map',
  plugins: [
    new ExtractTextPlugin({filename: 'css/app.css', allChunks: true, disable: false}),
    new CopyWebpackPlugin([{from: join('web/static/assets'), to: join('priv/static')}], {debug: 'warning'})
  ]
};
