-- Theme/Colorscheme
return {
	{
		'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
		lazy = false, -- We want the colorscheme to load immediately when starting Neovim
		priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
		opts = {
			-- Replace this with your scheme-specific settings or remove to use the defaults
			-- background = {
			--   dark = "wave",
			-- },
		},
		config = function(_, opts)
			require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
			-- vim.cmd("colorscheme gruvboxgpf") -- Replace this with your favorite colorscheme
			-- Colorscheme overrides
			vim.cmd([[
		      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
		      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
		      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
		      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
		    ]])
		end
	},
	-- Lazy
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000 -- Ensure it loads first
	},

	{ 'navarasu/onedark.nvim' },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- config = function()
		--   vim.cmd.colorscheme 'catppuccin'
		-- end,

	},
	{
		"folke/tokyonight.nvim",
		-- ensure that the color scheme is loaded at the very beginning
		lazy = false,
		priority = 1000,
		-- enable the colorscheme
		-- config = function() vim.cmd.colorscheme("tokyonight") end,
	},

	{
		'ChristianChiarulli/nvcode-color-schemes.vim',

		config = function()
			vim.cmd("colorscheme gruvboxgpf") -- Replace this with your favorite colorscheme
			-- Colorscheme overrides
			vim.cmd([[
		      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
		      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
		      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
		      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
		    ]])
		end
	},
	{ "rebelot/kanagawa.nvim" },
	-- {
	--   -- Theme
	--   'morhetz/gruvbox',
	--   --'gruvbox-community/gruvbox',
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme 'gruvbox'
	--   end,
	-- },
}

