#let iridis-palette = (
	color.rgb("#7D00E5"),
	color.rgb("#FF0000"),
	color.rgb("#0094FF"),
	color.rgb("#FF6A00"),
	color.rgb("#00FF00"),
	color.rgb("#0041FF"),
	color.rgb("#EDCC14"),
)


#let iridis-show(
	opening-parenthesis: ("(","[","{"),
	closing-parenthesis: (")","]","}"),
	palette: iridis-palette,	
	body
) = {

	let counter = counter("parenthesis")
	let need-regex-escape = (c) => {
		(c == "(") or (c == ")") or (c == "[") or (c == "]") or (c == "{") or (c == "}") or (c == "\\") or (c == ".") or (c == "*") or (c == "+") or (c == "?") or (c == "^") or (c == "$") or (c == "|") or (c == "-")
	}

	let build-regex = (chars) => {
		chars.fold("", (acc, c) => {
			acc + (if need-regex-escape(c) { "\\" } else {""}) + c + "|"
		}).slice(0, -1)
	}

	show regex(build-regex(opening-parenthesis)) : body => context {
		counter.update(n => n + 1)
		show: text(fill: palette.at(calc.rem(counter.get().at(0), palette.len())), body)
	}

	show regex(build-regex(closing-parenthesis)) : body => context {
		counter.update(n => n - 1)
		show: text(fill: palette.at(calc.rem(counter.get().at(0) - 1, palette.len())), body)
	}
	body
}
