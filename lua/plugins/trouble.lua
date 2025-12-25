return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>E",
			"<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>",
			desc = "[E]rror diagnostics for entire workspace"
		},
		{
			"<leader>e",
			"<cmd>Trouble diagnostics toggle filter = { buf=0, severity=vim.diagnostic.severity.ERROR }<cr>",
			desc = "[e]rror diagnostics for this buffer"
		},
		{
			"<leader>W",
			"<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.WARNING<cr>",
			desc = "[W]arning diagnostics for the entire workspace"
		},
		{
			"<leader>w",
			"<cmd>Trouble diagnostics toggle filter = { buf=0, severity=vim.diagnostic.severity.WARNING }<cr>",
			desc = "[w]arning diagnostics for this buffer"
		}
	},
}
