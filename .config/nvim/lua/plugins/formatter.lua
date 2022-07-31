local utils = require "formatter.util"
require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {require("formatter.filetypes.lua").luaformatter},
        python = {
            function()
                return {exe = "blue", args = {"-"}, stdin = true}
            end
        },
        -- ["*"] = {require("formatter.filetypes.any").remove_trailing_whitespace}
    }
}
