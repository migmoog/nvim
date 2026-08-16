return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function ()
		require("treesitter-context").setup {
			multiwindow = true,
		}

		vim.api.nvim_set_hl(0, "TreesitterContext", {
			bold = true,
			update = true,
		})

		vim.keymap.set("n", "<leader>tC", ":TSContext toggle<CR>", {
			desc = "[T]oggle [C]ontext",
		})
	end,
}
