vim.opt.termguicolors = true

require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})

-- vim.cmd[[colorscheme zenburn]]
require('ayu').colorscheme()
-- require('no-clown-fiesta')
