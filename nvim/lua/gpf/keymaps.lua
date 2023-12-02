local map = vim.keymap.set


-- vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', {
--   noremap = true
-- })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

map('n', '<leader><F2>', ':NvimTreeToggle<CR>', { noremap = true, desc = "NvimTreeToggle" })

map('n', '<leader><F3>', ':Startify<CR>', { noremap = true, desc = 'Startify' })

map('n', '<leader><F4>', ':ToggleTerm<CR>', { noremap = true, desc = 'Open Terminal' })

map('n', '<leader><F5>', ':w <CR>:!cls <CR>:!python "%" <CR>', { noremap = true, desc = 'Save and run this python file' })

map('n', '<leader><F6>', ':NvimTreeOpen %:p:h <CR>',
  { noremap = true, desc = 'Open NvimTree in the current file directory' })

map('n', '<leader><F7>', ':UndotreeToggle <CR>', { noremap = true, desc = 'Toggle Undotree' })

map('n', '<leader>u', ':UndotreeToggle <CR>', { noremap = true, desc = 'Toggle Undotree' })

map('n', '<leader><F8>', ':NvimTreeFindFile <CR>', { noremap = true, desc = 'NvimTreeFindFile' })

-- [[ Basic Keymaps ]]

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- See `:help telescope.builtin`
map('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[R]ecently opened [F]iles' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]iles [F]ind' })
map('n', '<leader>fs', "<C-c>:update<cr>", { desc = '[F]ile [S]ave' })
map({ "n", "v", "i" }, "<C-S>", "<C-c>:update<cr>", { silent = true, desc = "Save File" })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
map('n', '<leader>gc', ':Git commit -a <CR>', { desc = '[G]it [C]ommit' })
map('n', '<leader>gp', ':Git push<CR>', { desc = '[G]it [P]ush' })
map('n', '<leader>gl', ':Git pull<CR>', { desc = '[G]it [P]ull' })

map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


-- keep visual selection when (de)indenting
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Move selected lines up/down in visual mode
map("x", "K", ":move '<-2<CR>gv=gv", {})
map("x", "J", ":move '>+1<CR>gv=gv", {})
map("x", "<M-Up>", ":move '<-2<CR>gv=gv", {})
map("x", "<M-Down>", ":move '>+1<CR>gv=gv", {})

map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("n", "<leader>wl", "<C-w>l", { silent = false, desc = "Go to the right" })
map("n", "<leader>wh", "<C-w>h", { silent = false, desc = "Go to the left" })
map("n", "<leader>wj", "<C-w>j", { silent = false, desc = "Go down" })
map("n", "<leader>wk", "<C-w>k", { silent = false, desc = "Go up" })

--Pane Movemente
map("n", "<leader>w<Right>", "<C-w>l", { silent = false, desc = "Go to the right" })
map("n", "<leader>w<Left>", "<C-w>h", { silent = false, desc = "Go to the left" })
map("n", "<leader>w<Down>", "<C-w>j", { silent = false, desc = "Go down" })
map("n", "<leader>w<Up>", "<C-w>k", { silent = false, desc = "Go up" })

-- Turn off search matches with double-<Esc>
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR>", { silent = true })
-- Toggle display of `listchars`
map("n", "<leader>'", "<Esc>:set list!<CR>", { silent = true, desc = "toggle 'listchars' on/off" })
-- Change current working dir (:pwd) to curent file's folder
map("n", "<leader>%", function() require("gpf.utils").set_cwd() end,
  { silent = true, desc = "smart set cwd (git|file parent)" })
-- Open python directory
map("n", "<leader>wp", ":cd C:/Users/forteg/OneDrive - Fratelli Carli Spa/Desktop/Python <CR>",
  { silent = false, desc = "cd Python" })
map("n", "<leader>wc", ":cd C:/Users/forteg/Appdata/Local/nvim <CR>", { silent = false, desc = "cd Nvim configuration" })

-- Buffer Management
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>bb', require('telescope.builtin').buffers, { desc = '[B]Find existing buffers' })
map('n', '<leader>bl', require('telescope.builtin').buffers, { desc = '[B]uffer [L]ist' })
map("n", "<leader>bn", "<Esc>:new<CR>", { silent = true, desc = "[B]uffer [N]ew" })
map("n", "<leader>bd", "<Esc>:bdelete<CR>", { silent = true, desc = "[B]uffer [D]elete" })
map("n", "<leader>bk", "<Esc>:bdelete<CR>", { silent = true, desc = "[B]uffer Kill" })
map("n", "<leader>bn", "<Esc>:bn<CR>", { silent = true, desc = "[B]uffer [N]ext" })
map("n", "<leader>bp", "<Esc>:bp<CR>", { silent = true, desc = "[B]uffer [P]revious" })

