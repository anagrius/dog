start
    = title? section*

title
    = "# " text:[a-z]i "\n" { return "<h1>" + text + "</h1>"; }

section
    = heading paragraph* { return heading + paragraph.join(""); }

heading
    = "## " text:[a-z]i "\n" { return "<h2>" + text + "</h2>"; }

paragraph
    = text:[a-z]i "\n" { return "<p>" + text + "</p>"; }
