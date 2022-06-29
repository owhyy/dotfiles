vim.opt.termguicolors = true

<<<<<<< HEAD
require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})

-- require('no-clown-fiesta')
require('ayu').colorscheme()
=======
-- vim.cmd("colorscheme candle-grey")
-- vim.cmd("colorscheme starrynight")

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd("colorscheme codeschool")

-- require("zenburn").setup()
vim.opt.termguicolors = true
require('lighthaus').setup({
  bg_dark = true,
  italic_comments = true,
})
>>>>>>> a1e7fffe591aa1bdfaf94e9132c223ef70865609
