path = require('path')
Parser = require path.join(__dirname, '..', 'lib', 'dog', 'parser')

module.exports.parse = (markup) ->
	Parser.parse(markup)