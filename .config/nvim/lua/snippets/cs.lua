return {
    s({ trig = "propr", dscr = "Expand into property definition with an init accessor.", },
        fmta("public <> <> { get; init; }<>", { i(1, "string?"), i(2, "MyProp"), i(0) })
    ),
    s({ trig = "cls", dscr = "Expand into class with the filename as class name.", },
        fmta("public class <>\n{\n    <>\n}", { f(function(_, snip)
            return snip.env.TM_FILENAME_BASE
        end), i(0) })
    ),
    s({ trig = "clsi", dscr = "Expand into class with inherits and the filename as class name.", },
        fmta("public class <> : <>\n{\n    <>\n}", {
            f(function(_, snip)
                return snip.env.TM_FILENAME_BASE
            end),
            i(1),
            i(0)
        })
    ),
    s({ trig = "ctor", dscr = "Expand into constructor with the filename as function name.", },
        fmta("public <>(<>)\n{\n    <>\n}", {
            f(function(_, snip)
                return snip.env.TM_FILENAME_BASE
            end),
            i(1),
            i(0)
        })
    ),
}