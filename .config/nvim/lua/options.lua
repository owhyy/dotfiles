-- Visual
vim.o.conceallevel = 0 -- Don't hide quotes in markdown
vim.o.cmdheight = 0
vim.o.pumheight = 10
vim.o.showmode = false
vim.wo.number = true
vim.wo.relativenumber = true

-- Behaviour
vim.o.hlsearch = false
vim.o.ignorecase = true -- Ignore case when using lowercase in search
vim.o.smartcase = true -- But don't ignore it when using upper case
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- Vim specific
vim.o.hidden = true -- Do not save when switching buffers
vim.o.fileencoding = "utf-8"
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.wildmode = "longest,full" -- Display auto-complete in Command Mode

-- Disable default plugins
-- vim.g.loaded_netrwPlugin = false

-- Python providers
local pynvim_env = "/.local/share/pyenv/versions/pynvim"
vim.g.python3_host_prog = os.getenv("HOME") .. pynvim_env .. "/bin/python"

vim.cmd([[
  let g:vimtex_view_method = 'zathura'
]])

vim.cmd([[
  let g:neoformat_enabled_python = ['blue']
]])

vim.cmd([[filetype plugin on]])

-- Disable inline error messages
vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	signs = true,
})

-- disable built-in plugins that I don't use
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded" .. plugin] = 1
end

-- disables builtin sql syntax autocomplete
-- vim.cmd("let g:omni_sql_default_compl_type = 'syntax'")

-- slime
vim.cmd("let g:slime_target = 'tmux'")
