vim.opt.termguicolors = true

require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})

-- require('zenburn').colorscheme()
vim.cmd[[colorscheme zenburn]]
-- require('ayu').colorscheme()
