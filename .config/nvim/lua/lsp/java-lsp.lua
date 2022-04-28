local nvim_lsp = require("lspconfig")

nvim_lsp.jdtls.setup {
    filetypes = {"java"},
    root_dir = nvim_lsp.util.root_pattern("gradlew", ".git", "pom.xml", "mvnw", "."),
    settings = {},
}
