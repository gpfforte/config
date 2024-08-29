--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- Set <space> as the leader key
-- See `:help mapleader`
-- DONE colored bracket
-- DONE color csv fare autommand solo per csv_semicolon - vedi in fondo
-- DONE colorize HEX or RGB colors
-- TODO cool launcher in floating window

vim.g.mapleader          = ' '
vim.g.maplocalleader     = ' '
-- Disable netrw because interfere with nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group    = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
	group = highlight_group,
	pattern = '*',
})



-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
-- User Config
-- ---
vim.g.user = {
	transparent = false,
	event = 'UserGroup',
	name = 'GPF',
	config = {
		undodir = vim.fn.stdpath('cache') .. '/undo',
	},
}
--make
-- Global user group to register other custom autocmds
vim.api.nvim_create_augroup(vim.g.user.event, {})
vim.api.nvim_create_autocmd('BufReadPost', {
	group = vim.g.user.event,
	callback = function(args)
		local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
		local not_commit = vim.b[args.buf].filetype ~= 'commit'

		if valid_line and not_commit then
			vim.cmd([[normal! g`"]])
		end
	end,
})

-- Associate .csv with semicolon
-- autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' },
	{
		pattern = { '*.csv' },
		group = vim.g.user.event,
		command = "set filetype=csv_semicolon"
	})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' },
	{
		pattern = "*.py", -- filetype for which to run the autocmd
		group = vim.g.user.event,
		command = "Gitsign toggle_current_line_blame"
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python", -- filetype for which to run the autocmd
	callback = function()
		-- use pep8 standards
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4

		-- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
		-- if you are a heavy user of folds, consider using `nvim-ufo`
		vim.opt_local.foldmethod = "indent"

		-- automatically capitalize boolean values. Useful if you come from a
		-- different language, and lowercase them out of habit.
		vim.cmd.inoreabbrev("<buffer> true True")
		vim.cmd.inoreabbrev("<buffer> false False")

		-- in the same way, we can fix habits regarding comments or None
		vim.cmd.inoreabbrev("<buffer> -- #")
		vim.cmd.inoreabbrev("<buffer> null None")
		vim.cmd.inoreabbrev("<buffer> none None")
		vim.cmd.inoreabbrev("<buffer> nil None")
	end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
--vim: ts=2 sts=2 sw=2 et

