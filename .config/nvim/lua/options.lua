-- Visual
vim.o.conceallevel = 0 -- Don't hide quotes in markdown
-- vim.o.cmdheight = 0
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
vim.o.mouse = 'a'
vim.o.clipboard = "unnamedplus"

-- Vim specific
vim.o.hidden = true -- Do not save when switching buffers
vim.o.fileencoding = "utf-8"
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.wildmode = "longest,full" -- Display auto-complete in Command Mode
-- vim.o.updatetime         = 300                           -- Delay until write to Swap and HoldCommand event

-- Disable default plugins
-- vim.g.loaded_netrwPlugin = false

-- Providers
-- vim.g.python3_host_prog  = '/home/milton/software/miniconda/envs/pynvim/bin/python'

vim.cmd [[
  let g:vimtex_view_method = 'zathura'
]]

vim.cmd [[
  let g:neoformat_enabled_python = ['blue']
]]

vim.cmd [[filetype plugin on]]

-- Disable inline error messages
vim.diagnostic.config {
    virtual_text = true,
    underline = false -- Keep error underline
}
