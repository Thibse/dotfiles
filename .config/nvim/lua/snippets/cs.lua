return {
    s({ trig = "propr", dscr = "Expand into property definition with an init accessor.", },
        fmta("public <> <> { get; init; }<>", { i(1, "string?"), i(2, "MyProp"), i(0) })
    )
}