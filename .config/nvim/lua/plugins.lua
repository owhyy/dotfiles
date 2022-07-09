-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
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
    use({'wbthomason/packer.nvim', opt = true})

    -- Formatting
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use 'junegunn/vim-easy-align'

    -- LSP server
    use({
        'neovim/nvim-lspconfig',
        config = function() require('plugins.lspconfig') end
    })
    -- Helper for installing most language servers
    use 'williamboman/nvim-lsp-installer'

    use 'mfussenegger/nvim-jdtls' -- java lsp

    -- Autocomplete
    use({"L3MON4D3/LuaSnip", config = function() require('plugins.luasnip') end}) -- Snippet engine

    use({
        "hrsh7th/nvim-cmp",
        -- Sources for nvim-cmp
        requires = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-omni", "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua", "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", "honza/vim-snippets"
        },
        config = function() require('plugins.cmp') end
    })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        run = ':TSUpdate'
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function() require('plugins.telescope') end
    })

    use 'nvim-telescope/telescope-dap.nvim'
    use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
    use 'p00f/nvim-ts-rainbow'

    -- Latex
    use "lervag/vimtex"

    -- Better movement
    use "ggandor/lightspeed.nvim"
    -- Bracket thing
    use "tpope/vim-surround"
    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        config = function() require('plugins.lualine') end
    })

    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('plugins.nvimtree') end,
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- Colorthemes
    use 'phha/zenburn.nvim'
    use 'mrjones2014/lighthaus.nvim'
    use 'Shatur/neovim-ayu'
    use 'aktersnurra/no-clown-fiesta.nvim'
    use 'folke/tokyonight.nvim'

    -- Pascal linter
    use 'dylanaraps/pascal_lint.nvim'
    -- Racket better support
    use 'wlangstroth/vim-racket'
    -- Better SML support
    use 'jez/vim-better-sml'
    -- Pyret support
    use 'rachitnigam/pyret-lang.vim'
    -- Indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.indent-blankline') end
    }
    -- smooth scrolling
    use 'karb94/neoscroll.nvim'
    require('neoscroll').setup()

    -- Better formatter
    use 'sbdchd/neoformat'

    -- Diagnostics window
    use 'folke/trouble.nvim'

    -- Make statusline and tmux's statusline be the same
    -- use 'vimpostor/vim-tpipeline'
    -- use 'edkolev/tmuxline.vim'
    -- Python text objects
    use 'jeetsukumaran/vim-pythonsense'

    -- .tmux.conf highlighting
    use 'tmux-plugins/vim-tmux'

    -- ctags
    use 'quangnguyen30192/cmp-nvim-tags'
    use 'ludovicchabant/vim-gutentags'

    -- debugger
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use {
        'mfussenegger/nvim-dap',
        config = function() require('plugins.dapconfig') end
    }

    -- autopairs
    use 'windwp/nvim-autopairs'
    require('nvim-autopairs').setup({
        disable_filetype = {"TelescopePrompt", "markdown"}
    })
    -- zettelkasetn
    use("mickael-menu/zk-nvim")
    require("zk").setup {}

    if packer_bootstrap then require('packer').sync() end
end)
