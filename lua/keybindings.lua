-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- -- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>q", function()
-- 	vim.diagnostic.setloclist({ severity = vim.diagnostic.severity.ERROR })
-- end, { desc = "Open diagnostic [Q]uickfix list (Shows only errors)" })
-- vim.keymap.set("n", "<leader>qa", vim.diagnostic.setloclist, { desc = "Open [Q]uickfix Messages of [A]ll types" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

local hjkl = {
	["h"] = { direction = "left", split_sizer = ">" },
	["j"] = { direction = "down", split_sizer = "-" },
	["k"] = { direction = "up", split_sizer = "+" },
	["l"] = { direction = "right", split_sizer = "<" },
}
for key, rel in pairs(hjkl) do
	-- split navigation
	vim.keymap.set(
		"n",
		"<Tab>" .. key,
		"<C-w><C-" .. key .. ">",
		{ desc = "Move focus to the " .. rel.direction .. "  window" }
	)
	-- split sizing
	vim.keymap.set("n", "<Tab><Tab>" .. key, "<C-w>" .. rel.split_sizer, { desc = "Stretch window " .. rel.direction })
end

-- Unit test keybindings, based on language
for keybind, info in pairs {
	["<leader>ta"] = {
		fts = {
			lua = MiniTest.run,
			rust = function ()
				vim.system {"cargo", "test"}
			end
		},
		desc = "[T]est [a]ll files"
	},
	["<leader>tt"] = {
		fts = {
			lua = MiniTest.run_file,
			rust = function ()
				vim.notify("TODO RUST: Testing a specific file")
			end
		},
		desc = "[T]est [t]his file"
	},
	["<leader>ta"] = {
		fts = {
			lua = MiniTest.run_at_location,
			rust = function ()
				vim.notify("TODO RUST: Running the test at the cursor")
			end
		},
		desc = "[T]est under [c]ursor"
	},
} do
	vim.keymap.set("n", keybind, function ()
		local test_fn = info.fts[vim.bo.filetype]
		if test_fn then
			test_fn()
		else
			vim.notify(
				string.format("No way to %s for %s files", info.desc, vim.bo.filetype),
				vim.log.levels.DEBUG
			)
		end
	end, {desc = info.desc})
end
