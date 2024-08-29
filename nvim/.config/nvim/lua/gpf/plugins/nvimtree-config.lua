local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<C-y>', api.node.open.vertical, opts('Open: Vertical Split'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return {
	{ 'nvim-tree/nvim-tree.lua',
        config=function()
            require("nvim-tree").setup({
              -- sort_by = "case_sensitive",
              on_attach = my_on_attach,
              sort = {
                sorter = "case_sensitive", },
              view = {
                width = 30,
                number = false,
                float = {
                  enable = false
                },
              },
              renderer = {
                group_empty = true,
                full_name = true,
              },
              filters = {
                dotfiles = false,
              },
            })
        
        end
        
    },
}

