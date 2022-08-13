require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.ERROR,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			function()
				return { exe = "blue", args = { "-", "-l 96"}, stdin = true }
			end,
			require("formatter.filetypes.python").autopep8,
			require("formatter.filetypes.python").isort,
		},
		json = { require("formatter.filetypes.json").prettier },
		markdown = { require("formatter.filetypes.markdown").prettier },
		yaml = { require("formatter.filetypes.yaml").prettier },
		racket = {
			function()
				return { exe = "raco fmt", args = { "-i" }, stdin = true }
			end,
		},
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
