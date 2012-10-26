start
	= document:document EOF { return document; }

document
	= title:title? section:section* { return title + section.join(""); }

title
	= "# " text:text "\n"? { return "<h1>" + text + "</h1>\n"; }

section
	= heading (paragraph "\n\n"?)* { return heading + paragraph.join(""); }

heading
	= "## " text:text { return "<h2>" + text + "</h2>"; }

paragraph
	= text:text { return "<p>" + text + "</p>"; }

text
	= chars:[a-z \n]i+ { return chars.join(""); }

EOF
	= !.