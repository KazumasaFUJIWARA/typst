#let definition(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "定義",
	)[
		#block(
			radius: 4pt,
			inset: 10pt,
			fill: silver,
			width: 100%,
		)[
			#align(left)[
				*定義 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let theorem(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "定義",
	)[
		#block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (2pt + black),
		)[
			#align(left)[
				*定理*
				#context counter(figure.where(kind: "prop")).display()
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proposition(title: none, id: none, it) = [

	#figure(
		kind: "prop",
		supplement: "命題",
	)[
		#block(
			radius: 4pt,
			inset: 10pt,
			fill: luma(250),
			width: 100%,
			stroke: (2pt + gray),
		)[
			#align(left)[
				*命題 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let lemma(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "補題",
	)[
		#block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (4pt + silver),
		)[
			#align(left)[
				*補題 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let corollary(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "系",
	)[
		#block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (2pt + silver),
		)[
			#align(left)[
				*系 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let remark(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "註",
	)[
		#block(
			inset: 10pt,
			width: 100%,
			stroke: (left: 2pt + black),
		)[
			#align(left)[
				*註 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let example(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "例",
	)[
		#block(
			inset: 10pt,
			width: 100%,
			stroke: (left: 2pt + gray),
		)[
			#align(left)[
				*例 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proof(title: none, it) = {
	strong("証明: " + title)
	it
	align(right)[□]
}

#let mythm(
	title: none,
	affiliation: none,
	author: none,
	date: none,
	doc,
) = {
	set page(
		margin: 20mm,
		paper: "a4",
	)
	set text(
		size: 11pt,
	)
	set heading(numbering: "1.")

	// level 1ヘッダーの更新時のみ変更
	show heading.where(level: 1): it => {
		counter(math.equation).update(0)
		counter(figure.where(kind: image)).update(0)
		counter(figure.where(kind: table)).update(0)
		counter(figure.where(kind: raw)).update(0)
		it
	}

	set math.equation(
		numbering: num =>
			numbering("(1.1)", counter(heading).get().first(), num),
			number-align: bottom
	)
	set figure(
		numbering: num =>
			numbering("1.1", counter(heading).get().first(), num)
	)
	show math.equation: it => {
		if it.block and not it.has("label") [
			#counter(math.equation).update(v => v - 1)
			#math.equation(it.body, block: true, numbering: none)#label("")
		] else {
		it
		}
	}

	if title != none {
		align(center)[
			#text(size:18pt, weight: "bold")[#title]
		]
	}
	if date != none {
		align(right)[
			#text(size:12pt)[#date]
		]
	}
	if affiliation != none {
		v(-0.8em)
		align(right)[
			#text(size:12pt)[#affiliation]
		]
	}
	if author != none {
		v(-0.8em)
		align(right)[
			#text(size:12pt, weight: "bold")[#author]
		]
	}
	doc
}

