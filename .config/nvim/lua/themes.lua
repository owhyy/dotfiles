vim.opt.termguicolors = true

require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})

-- require('no-clown-fiesta')
require('ayu').colorscheme()
