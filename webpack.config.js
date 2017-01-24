const path = require("path");
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin");


function join(dest) {
  return path.resolve(__dirname, dest);
}

const elmSource = __dirname + "/web/elm";
const cssMain = join('web/static/css/app.css');
const elmMain = join('web/elm/Main.elm');
const javascriptMain = join('web/static/js/app.js');

const config = module.exports = {
  entry: [
    cssMain,
    elmMain,
    javascriptMain,
  ],
  output: {
    path: join('priv/static'),
    filename: "js/app.js",
  },
  module: {
    noParse: [/\.elm/],
    rules: [
      {
        test: /\.elm/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: `elm-webpack-loader?verbose=true&warn=true&debug=true&cwd=${elmSource}`,
      },
      {
        test: /\.js/,
        exclude: /node_modules/,
        loader: "babel-loader",
      },
      {
        test: /\.css/,
        exclude: /node_modules/,
        loader: ExtractTextPlugin.extract({
          fallbackLoader: 'style-loader',
          loader: [
            'css-loader?modules&importLoaders=1',
            'postcss-loader'
          ]
        })
      }
    ]
  },
  devtool: 'source-map',
  plugins: [
    new ExtractTextPlugin( {filename: 'css/app.css', allChunks: true, disable: false } )
  ]
}
