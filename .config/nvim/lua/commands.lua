-- Define commands

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Swap folder
vim.cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
vim.cmd('command! CleanSwap !rm -rf ~/.local/share/nvim/swap/')

-- Open help tags
vim.cmd("command! HelpTags Telescope help_tags")

-- autocompile dwm and dwmblocks when saving (not working for some reason :( )
-- vim.cmd [[autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; sudo make install && {killall -q dwm;setsid -f dwm}]]
-- vim.cmd [[autocmd BufWritePost ~/.local/src/dwmblocks/blocks.h !cd ~/.local/src/dwmblocks/; sudo make install && {killall -q dwmblocks;setsid -f dwmblocks}]]

-- fpc complier autorun
vim.cmd [[autocmd BufWritePost *.pas :FPC]]

-- highlight yanked text
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
]]
