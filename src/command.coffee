fs = require 'fs'
path = require 'path'
uglifyjs = try require 'uglify-js'

Dog = require './module'

inspect = (o) -> (require 'util').inspect o, no, 9e9, yes

# clone args
args = process.argv[1 + (process.argv[0] is 'node') ..]

# ignore args after --
additionalArgs = []
if '--' in args then additionalArgs = (args.splice (args.indexOf '--'), 9e9)[1..]

# TODO: We want lots of advanced options, like watch and stuff.
input = args[0]

fs.readFile options.input, (err, content) ->
    throw err if err?
    output = Dog.compile(content)
    console.log output