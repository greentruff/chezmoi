function _tide_item_vcs
    if command -sq jj; and jj root --quiet &>/dev/null
        _tide_item_jj
    else
        _tide_item_git
    end
end
