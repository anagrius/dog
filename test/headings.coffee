suite 'Titles and Headings', ->

	test "# designates a document title", ->
		{ parse } = require "./test-helper"
		html = parse "# Be Awesome Instead"
		ok html is "<h1>Be Awesome Instead</h1>\n"
