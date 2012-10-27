module.exports =

	class Node
		_parent: null

		addChild: (childNode) ->
			return unless childNode?
			@children = [] unless @children?
			childNode._setParent(this)
			@children.push(childNode)

		addList: (childNodeList) ->
			return unless childNodeList?
			@addChild(child) for child in childNodeList

		removeChild: (childNode) ->
			return if childNode._parent != this
			childNode._parent = null
			@children.remove(childNode)

		removeList: (childNodeList) ->
			return unless childNodeList?
			@removeChild(child) for child in childNodeList

		_setParent(parentNode) ->
			@_parent = parentNode

		getParent: ->
			@_parent

	class TextNode extends Node
		constructor: (@text) ->

	class SectionNode extends Node
		constructor: (@level, text) ->
			super(text)

	class HeadingNode extends Node
		constructor: (@level, text) ->
			super(text)

	class ParagraphNode extends TextNode
		constructor: (text) ->
			super(text)