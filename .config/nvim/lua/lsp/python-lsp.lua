local nvim_lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.pyright.setup {
    capabilities = capabilities,
    -- settings = {
    --     pyright = {
    --       typingPath="./typings",
    --     }
    -- }
}
