-- NVIM tree

local options = {
	disable_netrw = false,
	hijack_netrw = false,
	update_cwd = true,
	view = {
		adaptive_size = true,
		side = "left",
		width = 25,
		hide_root_folder = true,
	},
}

require("nvim-tree").setup(options)
