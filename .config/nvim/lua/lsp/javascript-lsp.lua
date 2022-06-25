local nvim_lsp = require("lspconfig")

nvim_lsp.eslint.setup {
    root_dir = nvim_lsp.util.root_pattern(".git", "."),
    settings = {},
}
