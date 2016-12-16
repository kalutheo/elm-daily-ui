const path = require('path');

module.exports = {
  module: {
    loaders: [
      {
        test: /.css$/,
        loaders: ["style", "css"],
        include: path.resolve(__dirname, '../')
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack'
      }
    ]
  }
}
