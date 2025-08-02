return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true
	},

	config = function (opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "-", ":Oil<CR>")
	end
}
