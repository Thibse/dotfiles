return {
	s({ trig = "ch", dscr = "Expand 'ch' into '\\chapter{}'" }, fmta("\\chapter{<>}\n<>", { i(1), i(0) })),

	s({ trig = "sc", dscr = "Expands 'sc' into '\\section{}'" }, fmta("\\section{<>}\n<>", { i(1), i(0) })),
	s({ trig = "ssc", dscr = "Expands 'ssc' into '\\subsection{}'" }, fmta("\\subsection{<>}\n<>", { i(1), i(0) })),
	s(
		{ trig = "sssc", dscr = "Expands 'sssc' into '\\subsubsection{}'" },
		fmta("\\subsubsection{<>}\n<>", { i(1), i(0) })
	),
	-- acronym
	s({ trig = "ac", dscr = "Expands 'ac' into '\\ac{}'" }, fmta("\\ac{<>}", { i(1) })),
	-- textcite
	s({ trig = "it", dscr = "Expands 'it' into '\\textit{}'" }, fmta("\\textit{<>}", { i(1) })),
	-- cite
	s({ trig = "ct", dscr = "Expands 'ct' into '~\\cite[]{}'" }, fmta("\\cite[S.~<>]{<>}", { i(2), i(1) })),
	-- textcite
	s({ trig = "tct", dscr = "Expands 'tct' into '\\textcite{}'" }, fmta("\\textcite{<>}", { i(1) })),
	-- shrot cite
	s({ trig = "cts", dscr = "Expands 'cts' into '\\cite{}'" }, fmta("\\cite{<>}", { i(1) })),
}
