-- Treesitter configuration
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"markdown"}
    },
    rainbow = {enable = true, extendded_mode = true},
    -- We must manually specify which parsers to install
    ensure_installed = {
        "bash", "latex", "c", "cpp", "lua", "python", "markdown"
        -- "racket",
    },
    indent = {enable = true}
})

-- local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
-- parser_config.racket = {
--     install_info = {
--         url = "~/tree-sitter-racket", -- local path or git repo
--         files = {"src/parser.c", "src/scanner.cc"}
--     },
--     filetype = "rkt" -- if filetype does not agrees with parser name
-- }
