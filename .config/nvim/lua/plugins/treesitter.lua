-- Treesitter configuration
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"markdown"}
    },
    rainbow = {enable = true, extendded_mode = true},
    -- We must manually specify which parsers to install
    ensure_installed = {
        "bash", "latex", "c", "cpp", "lua", "python", "markdown",
        "racket",
    },
    indent = {enable = true}
})
