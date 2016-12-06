var path = require("path");
var webpack = require("webpack");

var elmSource = __dirname + "/web/elm";
var outputElm = "/web/static/js/main.js"

function join(dest) {
  return path.resolve(__dirname, dest);
}

const config = module.exports = {
  entry: [
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
    noParse: [/\.elm$/],
    rules: [
      {
        test: /\.elm$/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: `elm-webpack-loader?verbose=true&warn=true&debug=true&cwd=${elmSource}`,
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
      }
    ]
  }
}
