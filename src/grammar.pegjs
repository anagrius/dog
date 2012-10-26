{
	var tag = function (name, content) {
		return "<" + name + ">" + content + "</" + name + ">";
	};
}

start
	= document:document EOF { return document; }

document
	= title:title? section:section* { return title + section.join(""); }

title
	= "# " text:line { return tag("h1", text); }

section
	= heading:heading paragraph:paragraph* { return heading + paragraph; }

heading
	= level:"#"+ " " text:line {
		var headerLevel = level.length;
		return tag("h" + headerLevel, text.trim())
	}

paragraph
	= text:line { return tag("p", text); }

line
	= chars:[a-z ?]i+ "\n"? { return chars.join(""); }

_ "whitespace"
	= whitespace*

whitespace
	= [ \t\n\r]

EOF
	= !.