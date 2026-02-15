function _tide_item_jj
    if not command -sq jj; or not jj root --quiet &>/dev/null
        return 1
    end

    set jj_status (jj log -r@ -n1 --no-graph --color always -T '
    separate("|",
        coalesce(
            bookmarks.join(" "),
            self.parents().filter(|c| !c.immutable() && c.bookmarks().len() > 0).map(|c| c.bookmarks().join(", ")).join("\\n") ++ "≠"
        ),
        change_id.shortest(),
        coalesce(
            if(
                description.first_line().substr(0, 80).starts_with(description.first_line()),
                description.first_line().substr(0, 80),
                description.first_line().substr(0, 79) ++ "…"
            ),
            "no description"
        ),
        if(conflict, label("conflict", "(conflict)")),
        if(empty, label("empty", "(empty)")),
        if(divergent, "(divergent)"),
    )' | string trim)
    _tide_print_item jj $tide_jj_icon' ' "($jj_status)"
end
