local map = vim.keymap.set


-- vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', {
--   noremap = true
-- })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

map('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true})

map('n', '<F3>', ':Startify<CR>', {noremap = true})

map('n', '<F4>', ':ToggleTerm<CR>', {noremap = true, desc='Open Terminal'})

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
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
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

map({ "n", "v", "i" }, "<C-S>", "<C-c>:update<cr>", { silent = true, desc = "Save" })
map("n", "<C-l>","<C-w>l")
map("n", "<C-h>","<C-w>h")
map("n", "<C-j>","<C-w>j")
map("n", "<C-k>","<C-w>k")

-- Turn off search matches with double-<Esc>
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR>", { silent = true })
-- Toggle display of `listchars`
map("n", "<leader>'", "<Esc>:set list!<CR>",  { silent = true, desc = "toggle 'listchars' on/off" })
-- Change current working dir (:pwd) to curent file's folder
map("n", "<leader>%",  function() require("gpf.utils").set_cwd() end,
  { silent = true, desc = "smart set cwd (git|file parent)" })
-- Open python directory
map("n", "<leader>p", ":cd C:/Users/forteg/OneDrive - Fratelli Carli Spa/Desktop/Python <CR>", { silent = false, desc = "cd Python" })

-- Buffer Management
map("n", "<leader>bn", "<Esc>:new<CR>",  { silent = true, desc = "[B]uffer [N]ew" })
map("n", "<leader>bd", "<Esc>:bdelete<CR>",  { silent = true, desc = "[B]uffer [D]elete" })
map("n", "<leader>bn", "<Esc>:bn<CR>",  { silent = true, desc = "[B]uffer [N]ext" })
map("n", "<leader>bp", "<Esc>:bp<CR>",  { silent = true, desc = "[B]uffer [P]revious" })
map('n', '<leader>bl', require('telescope.builtin').buffers, { desc = '[B]uffer [L]ist' })

