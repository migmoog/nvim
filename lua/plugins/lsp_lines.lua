return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function ()
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = false
		})

		local show_all_lines = false
		vim.keymap.set("n", "<leader>qa", function ()
			show_all_lines = not show_all_lines
			vim.diagnostic.config({ virtual_lines = show_all_lines })
		end, {desc = "Show list of all errors"})

		local show_current_line = false
		vim.keymap.set("n", "<leader>q", function ()
			show_current_line = not show_current_line
			if show_current_line then
				vim.diagnostic.config({ virtual_lines = { only_current_line = true }})
			else 
				vim.diagnostic.config({ virtual_lines = false })
			end
		end, {desc = "Show error on current line"})
	end
}
