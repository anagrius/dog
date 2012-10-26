start
	= document:document EOF { return document; }

document
	= title:title? section:section* { return title + section.join(""); }

title
	= "# " text:line { return "<h1>" + text + "</h1>"; }

section
	= heading:heading paragraph:paragraph* { return heading + paragraph; }

heading
	= "## " text:line { return "<h2>" + text + "</h2>"; }

paragraph
	= text:line { return "<p>" + text + "</p>"; }

line
	= chars:[a-z ]i+ "\n"? { return chars.join(""); }

_ "whitespace"
	= whitespace*

whitespace
	= [ \t\n\r]

EOF
	= !.