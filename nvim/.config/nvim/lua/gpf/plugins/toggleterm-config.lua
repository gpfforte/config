
if vim.loop.os_uname().sysname == "Windows_NT" then
  terminale = 'powershell'
else
  terminale = 'fish'
end
return    {
      'akinsho/toggleterm.nvim',
      -- config = true,
      config = function()
            require("toggleterm").setup({
              direction = 'float',
              close_on_exit = true, -- close the terminal window when the process exits
              -- Change the default shell. Can be a string or a function returning a string
              -- shell = vim.o.shell,
              shell = terminale,
              auto_scroll = true, -- automatically scroll to the bottom on terminal output
              -- This field is only relevant if direction is set to 'float'
              float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'curved', -- | ... other options supported by win open
                -- like `size`, width and height can be a number or function which is passed the current terminal
                width = 120,
                height = 40,
                winblend = 3,
                zindex = 1,
              },
            })
      end,
      direction = "float",
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved', --| ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
        width = 60,
        height = 60,
        winblend = 3,
        zindex = 1,
      },
    }
