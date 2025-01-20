return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("nvim-tree").setup()
		-- Use "-" to get back to the directory tree
		vim.keymap.set("n", "-", ":NvimTreeToggle<CR>", { desc = "Go to file tree" })
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
