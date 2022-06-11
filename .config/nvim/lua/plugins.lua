-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize pluggins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({ 'wbthomason/packer.nvim', opt = true })

  -- Formatting
  use 'tpope/vim-commentary'
  use 'junegunn/vim-easy-align'

  -- LSP server
  use({
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  })
  use 'williamboman/nvim-lsp-installer' -- Helper for installing most language servers

  use 'mfussenegger/nvim-jdtls' -- java lsp


  -- Autocomplete
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      --      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "honza/vim-snippets",
    },
    config = function() require('plugins.cmp') end,
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end, -- Must add this manually
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  use 'p00f/nvim-ts-rainbow'

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function() require('plugins.telescope') end,
  })

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Latex
  use "lervag/vimtex"

  -- Better movement
  use "ggandor/lightspeed.nvim"
  -- Bracket thing
  use "tpope/vim-surround"
  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    config = function() require('plugins.lualine') end,
  })

  -- black colorthemes
  -- use 'mrjones2014/lighthaus.nvim'
  use 'Shatur/neovim-ayu'
  use 'aktersnurra/no-clown-fiesta.nvim'
  -- highlightedyank
  use 'machakann/vim-highlightedyank'
  -- smooth scrolling
  use 'karb94/neoscroll.nvim'
  require('neoscroll').setup()

  -- Pacal linter
  use 'dylanaraps/pascal_lint.nvim'
  -- Racket better support
  use 'wlangstroth/vim-racket'
  -- Better SML support
  use 'jez/vim-better-sml'
  -- Pyret support
  use 'rachitnigam/pyret-lang.vim'

  -- Better formatter
  use 'sbdchd/neoformat'

  -- Diagnostics window
  use 'folke/trouble.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
