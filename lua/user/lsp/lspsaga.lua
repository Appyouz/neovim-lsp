local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	server_filetype_map = {
		typescript = "typescript",
	},
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
})
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
-- vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function()
	codeaction:code_action()
end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	codeaction:range_code_action()
end, { silent = true })
