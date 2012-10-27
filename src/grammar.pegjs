{
	var ast = require('./ast');
}

start
	= document:document EOF { return document; }

document
	= title:title? sections:section* {
		var document = new ast.Node();
		document.addChild(title);
		document.addList(sections);
		return document;
	}

title
	= "# " text:line {
		return new ast.HeadingNode(1, text);
	}

section
	= heading:heading paragraphs:paragraph* {
		var section = new ast.SectionNode();
		section.setHeading(heading);
		section.addList(paragraphs);
		return section;
	}

heading
	= level:"#"+ " " text:line {
		return new ast.HeadingNode(level.length, text);
	}

paragraph
	= text:line {
		return ast.ParagraphNode(text);
	}

line
	= chars:[a-z ?]i+ "\n"? {
		return chars.join("");
	}

_ "whitespace"
	= whitespace*

whitespace
	= [ \t\n\r]

EOF
	= !.