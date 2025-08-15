return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command",
				"set print pretty on"
			},
		}


		dap.configurations.cpp = {
			{
				type = "cpp",
				request = 'launch',
				name = "Launch file",

			}
		}
	end,
}
