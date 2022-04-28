local nvim_lsp = require("lspconfig")

nvim_lsp.racket_langserver.setup {
    filetypes = {"racket", "scheme"},
    root_dir = nvim_lsp.util.root_pattern(".git", "."),
    settings = {},
}
