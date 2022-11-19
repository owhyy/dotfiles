require("nvim-lsp-installer").setup({})
local nvim_lsp = require("lspconfig")
local utils = require("lsp.utils")
local common_on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable language servers with common settings
local servers = {
	"bashls",
	"clangd",
	"pyright",
	"texlab",
	"ocamllsp",
	"racket_langserver",
	"pasls",
	"solargraph",
	"sumneko_lua",
	"eslint",
	"tsserver",
	"dockerls",
	"yamlls",
	"cssls",
	"html",
	"emmet_ls",
	"graphql",
  "sqls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = common_on_attach,
		capabilities = capabilities,
	})
end

require("lspconfig").efm.setup({})
require("lsp.lua-lsp")
require("lsp.ruby-lsp")
require("lsp.ocaml-lsp")
require("lsp.racket-lsp")
require("lsp.javascript-lsp")
