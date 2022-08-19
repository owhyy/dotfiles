require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.ERROR,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			-- function()
			-- 	return { exe = "blue", args = { "-", "-l 96" }, stdin = true }
			-- end,
			function()
				return { exe = "black", args = { "-" }, stdin = true }
			end,
			require("formatter.filetypes.python").isort,
		},
		json = { require("formatter.filetypes.json").prettier },
		markdown = { require("formatter.filetypes.markdown").prettier },
		yaml = { require("formatter.filetypes.yaml").prettier },
		sh = { require("formatter.filetypes.sh").shfmt },
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		racket = {
			function()
				return { exe = "raco fmt", args = { "-i" }, stdin = true }
			end,
		},
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
