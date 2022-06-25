require("nvim-lsp-installer").setup {}
local nvim_lsp = require('lspconfig')
local utils = require('lsp.utils')
local common_on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable language servers with common settings
local servers = { "bashls", "clangd", "pyright", "texlab", "jdtls", "ocamllsp", "racket_langserver", "pasls", "prosemd_lsp", "solargraph", "sumneko_lua", "eslint" , "tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = common_on_attach,
    capabilities = capabilities,
  })
end

require('lsp.python-lsp')
require('lsp.java-lsp')
require('lsp.sumneko')
require('lsp.ruby-ls')
require('lsp.ocaml-lsp')
require('lsp.racket-lsp')
require('lsp.javascript-lsp')
