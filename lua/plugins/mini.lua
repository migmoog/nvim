return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function ()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup { n_lines = 500 }

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require "mini.statusline"
		-- set use_icons to true if you have a Nerd Font
		statusline.setup { use_icons = vim.g.have_nerd_font }

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function () return "%2l:%-2v" end
		-- autopairs
		local autopairs = require "mini.pairs"
		autopairs.config = {
			modes = { insert = true, command = false, terminal = false },
			-- Global mappings. Each right hand side should be a pair information, a
			-- table with at least these fields (see more in |MiniPairs.map|):
			-- - <action> - one of 'open', 'close', 'closeopen'.
			-- - <pair> - two character string for pair to be used.
			-- By default pair is not inserted after `\`, quotes are not recognized by
			-- `<CR>`, `'` does not insert pair after a letter.
			-- Only parts of tables can be tweaked (others will use these defaults).
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		}
		autopairs.setup()

		local test = require "mini.test"
		test.setup {}

		-- Splitting and joining arguments with `gS`
		local sj = require "mini.splitjoin"
		sj.setup()

		-- adds a :Git user command
		local git = require "mini.git"
		git.setup()

		-- file tree
		local files = require "mini.files"
		files.setup {
			mappings = {
				close = "<Esc>"
			}
		}
		vim.keymap.set("n", "-", MiniFiles.open, {
			desc = "Open filetree"
		})


		-- moving text
		local move = require "mini.move"
		move.setup()
	end,
}
