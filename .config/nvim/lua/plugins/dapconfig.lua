require('dap-python').setup('~/.local/lib/python3.10/venv/bin/python')
require('dap-python').test_runner = 'pytest'

vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B",
               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>lp",
               ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<Leader>dd", ":lua require'dapui'.open()<CR>")
vim.keymap.set("n", "<Leader>dc", ":lua require'dapui'.close()<CR>")
vim.keymap.set("v", "<Leader>ds", ":lua require('dap-python').debug_selection()<CR>")

require("nvim-dap-virtual-text").setup()
require("dapui").setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
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
                {id = "scopes", size = 0.25}, "breakpoints", "stacks", "watches"
            },
            size = 40, -- 40 columns
            position = "left"
        }, {
            elements = {"repl", "console"},
            size = 0.25, -- 25% of total lines
            position = "bottom"
        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1},
    render = {
        max_type_length = nil -- Can be integer or nil.
    }
})
