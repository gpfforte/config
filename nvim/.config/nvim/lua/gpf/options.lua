local o               = vim.opt
local g               = vim.g

vim.wo.cursorcolumn   = true
o.colorcolumn         = "79" -- set a visual marker to see the right margin
o.scrolloff           = 15
o.foldlevel           = 99   -- set in a way that the programs open unfolded
o.splitright          = true -- this way the split opens on the right
o.splitbelow          = true -- this way the split opens below
-- set termguicolors to enable highlight groups
o.termguicolors       = true
-- Set highlight on search
o.hlsearch            = true

-- Make line numbers default
vim.wo.number         = true
vim.wo.relativenumber = true
if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.g.startify_bookmarks = { '$HOME/AppData/Local/nvim/',
		'$HOME/OneDrive - Fratelli Carli Spa/Desktop/Python',
	}
else
	vim.g.startify_bookmarks = { '$HOME/.config/nvim/',
		'/mnt/c/Users/forteg/Onedrive - Fratelli Carli Spa/Desktop/Python/',
	}
end

g.startify_custom_header = false
-- Enable mouse mode
o.mouse                  = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
o.clipboard              = 'unnamedplus'

-- Enable break indent
o.breakindent            = true

-- Save undo history
o.undofile               = true

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase             = true
o.smartcase              = true

-- Keep signcolumn on by default
vim.wo.signcolumn        = 'yes'

-- Decrease update time
o.updatetime             = 250
o.timeoutlen             = 300

-- Set completeopt to have a better completion experience
o.completeopt            = 'menuone,noselect'


-- Search
o.showmatch      = true
o.smartcase      = true
o.ignorecase     = true
o.path           = { '**' }
o.wildignore     = { '*.git/*', '*node_modules/*', '*vendor/*', '*dist/*', '*build/*', "/*venv*/" }

-- Editor
o.expandtab      = true
o.lazyredraw     = true
o.spell          = false
o.wrap           = false
o.shiftwidth     = 4
o.smartindent    = true
o.softtabstop    = 4
o.wildignorecase = true

-- System
o.history        = 10000
o.swapfile       = false
o.undolevels     = 10000
o.updatetime     = 500

o.cmdheight      = 2 -- cmdline height
o.listchars      = {
	tab      = "→ ",
	eol      = "↲",
	nbsp     = "␣",
	lead     = "␣",
	space    = "␣",
	trail    = "•",
	extends  = "⟩",
	precedes = "⟨",
}
o.showbreak      = "↪ "
-- g.nvcode_termcolors = 256
-- vim.cmd.colorscheme("nvcode")
-- vim.cmd.colorscheme("gruvbox")
vim.diagnostic.config { virtual_text = false }


vim.cmd("colorscheme gruvboxgpf") -- Replace this with your favorite colorscheme

