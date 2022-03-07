local M = {}

vim.g.mkdp_browserfunc='chromium'
M.markdown_preview = function()
    -- https://github.com/wbthomason/packer.nvim/issues/620
    vim.cmd("doautocmd mkdp_init BufEnter")
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_page_title = "${name}"
end

