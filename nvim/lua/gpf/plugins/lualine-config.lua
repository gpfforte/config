
return    {
      -- Set lualine as statusline
      'nvim-lualine/lualine.nvim',
      --%{FugitiveStatusline()}
      -- See `:help lualine.txt`
      opts = {
        options = {
          icons_enabled = true,
          -- theme = 'gruvbox',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          -- lualine_b = {'branch', 'diff', 'diagnostics','FugitiveStatusline'},
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        }
      },
      -- config = function()
      -- 
      -- end
    }
