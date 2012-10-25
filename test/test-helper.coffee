Parser = require('path').join(__dirname, '..', 'lib', 'dog', 'parser')

module.exports.parse = (markup) ->
	Parser.compile(markup)