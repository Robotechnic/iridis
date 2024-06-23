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

	let counter = state("parenthesis", 0)
	let need-regex-escape = (c) => {
		(c == "(") or (c == ")") or (c == "[") or (c == "]") or (c == "{") or (c == "}") or (c == "\\") or (c == ".") or (c == "*") or (c == "+") or (c == "?") or (c == "^") or (c == "$") or (c == "|") or (c == "-")
	}

	let build-regex = (chars) => {
		chars.fold("", (acc, c) => {
			acc + (if need-regex-escape(c) { "\\" } else {""}) + c + "|"
		}).slice(0, -1)
	}

  let show-rules(body) =  context {
		
		show regex(build-regex(opening-parenthesis)) :  body => context {
			show: text.with(fill: palette.at(calc.rem(counter.get(), palette.len()))) 
			body
			counter.update(n => n + 1)
		}

		show regex(build-regex(closing-parenthesis)) : body => context {
			counter.update(n => n - 1)
			text(fill: palette.at(calc.rem(counter.get() - 1, palette.len())), body)
		}
		body
	}

	show raw : show-rules
	show math.equation : show-rules
 
	body
}

