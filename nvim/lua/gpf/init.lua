-- All my configurations starts from here

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require 'gpf.general'

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("gpf.plugins", {
	change_detection = {
		enabled = true, -- automatically check for config file changes and reload the ui
		notify = true, -- turn off notifications whenever plugin changes are made
	},
})

-- require 'gpf.plugins'
-- require 'gpf.autopairs-config'
require "gpf.options"
require "gpf.keymaps"
--require("nvim-tree.api").tree.open({path="C:/Users/forteg/OneDrive - Fratelli Carli Spa/Desktop/Python"})

