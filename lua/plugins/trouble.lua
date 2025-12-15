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
		}
	},
}
