return {
	"mistweaverco/bafa.nvim",
	version = "v1.10.1",
	config = function ()
		require("bafa").setup {}

		vim.keymap.set("n", "gb", function ()
			require("bafa").toggle {
				with_jump_labels = true,
			}
		end, {
			desc = "Open active buffers",
		})
	end,
}
