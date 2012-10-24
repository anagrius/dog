fs = require 'fs'
path = require 'path'
uglifyjs = try require 'uglify-js'

Parser = require './parser'
pkg = require path.join __dirname, '..', '..', 'package.json'


module.exports =
  VERSION: pkg.version

  Parser: Parser

  compile: (markup) ->
    try
      return Parser.parse(dog)
    catch e
      # TODO: Make the output of a syntax error easy to find the culprit.
      # throw e unless e instanceof Parser.SyntaxError
      # throw new Error(formatSyntaxError(dog, e))
      throw e
