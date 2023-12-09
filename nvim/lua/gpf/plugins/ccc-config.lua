return {
  -- color colorizer and picker
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require("ccc").setup({
        -- Your preferred settings
        -- Example: enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        }
        -- pickers = {
        --    ccc.picker.custom_entries({
        --      red = "#ff0000",
        --      green = "#00ff00",
        --    }),
        --  },
      })
    end
  },
}
--

