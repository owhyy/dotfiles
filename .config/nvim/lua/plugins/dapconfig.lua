local pydap = require("dap-python")
local test_runners = require("dap-python").test_runners
pydap.setup("~/.local/lib/python3.10/venv/bin/python")
pydap.test_runner = "pytest"

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "Django",
	program = vim.fn.getcwd() .. "/manage.py",
	args = { "runserver", "--noreload" },
})

local function prune_nil(items)
	return vim.tbl_filter(function(x)
		return x
	end, items)
end

-- copied from original configuration; changed so it uses same db
test_runners.django = function(classname, methodname)
	local path = vim.fn.expand("%:r:gs?/?.?")
	local test_path = table.concat(prune_nil({ path, classname, methodname }), ".")
	local args = { "test", test_path, "--keepdb", "--noinput", "-v 2" }
	return "django", args
end

vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<Leader>dd", ":lua require'dapui'.open()<CR>")
vim.keymap.set("n", "<Leader>dc", ":lua require'dapui'.close()<CR>")
vim.keymap.set("v", "<Leader>ds", ":lua require('dap-python').debug_selection()<CR>")

require("nvim-dap-virtual-text").setup()
require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
		eval = "<M-v>",
		float_element = "<M-m>",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = { "repl", "console" },
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})
