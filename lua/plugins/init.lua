local config_path = vim.fn.stdpath("config")
local abs_plugin_path = config_path .. "/lua/plugins"

-- using table manipulation because neovim atm can't match without a raw vimscript script
local all_files = vim.fn.readdir(abs_plugin_path)
local plugin_specs = {}

for _, v in ipairs(all_files) do
	-- ignore init or non lua files
  if v ~= "init.lua" and  string.match(v, "^(.+).lua$") then
		local module_name = string.gsub(v, "%.lua$", "")
    local plugin = require('plugins.' .. module_name)
		table.insert(plugin_specs, plugin)
	end
end

return plugin_specs
