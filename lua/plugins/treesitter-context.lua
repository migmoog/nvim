return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function ()
		require("treesitter-context").setup {}

		vim.keymap.set("n", "<leader>tC", ":TSContext toggle<CR>", {
			desc = "[T]oggle [C]ontext",
		})
	end,
}
