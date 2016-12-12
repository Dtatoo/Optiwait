var path = require("path");
var webpack = require("webpack");
var ExtractTextPlugin = require("extract-text-webpack-plugin");


var elmSource = __dirname + "/web/elm";

function join(dest) {
  return path.resolve(__dirname, dest);
}

const config = module.exports = {
  entry: [
    './web/static/css/app.css',
    "./web/static/js/app.js",
    "./web/elm/Main.elm",
  ],
  output: {
    path: join("priv/static"),
    filename: "js/app.js",
  },
  resolve: {
    modules: [ "node_modules", __dirname + "/web/static/js" ],
    extensions: [".js", ".elm"],
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
          fallbackLoader: "style-loader",
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
