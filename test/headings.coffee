{ inspect } = require 'util'

module.exports =

	"# designates a document title": ->
		html = parse "# Be Awesome Instead"
		assert.equal html, "<h1>Be Awesome Instead</h1>\n"
