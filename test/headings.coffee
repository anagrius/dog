{ inspect } = require 'util'

module.exports =

	"# designates a document title": ->
		html = parse "# Be Awesome Instead"
		assert.equal html, "<h1>Be Awesome Instead</h1>"

	"## creates a top section heading": ->
		html = parse "## The Old Man and the Sea"
		assert.equal html, "<h2>The Old Man and the Sea</h2>"

	"### creates a subsection": ->
		html = parse "### Do You Really Want To Hurt Me?"
		assert.equal html, "<h3>Do You Really Want To Hurt Me?</h3>"