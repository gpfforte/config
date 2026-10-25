return {
  -- 1. Plugin per evidenziare e gestire le ricerche con stile
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require('hlslens').setup({})

      -- Opzionale ma comodissimo: rende i comandi di ricerca n, N e * centrati e fluidi
      vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { silent = true })
      vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { silent = true })
      vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
      vim.keymap.set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
      vim.keymap.set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
      vim.keymap.set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
    end,
  },

  -- 2. La scrollbar laterale che ora comunicherà perfettamente con hlslens
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    dependencies = { "kevinhwang91/nvim-hlslens" },
    opts = {
      handlers = {
        diagnostic = true,
        search = true, -- Ora abilitato perché c'è hlslens!
        gitsigns = true,
      },
    },
    config = function(_, opts)
      require("scrollbar").setup(opts)
      require("scrollbar.handlers.search").setup({
        -- Configurazione opzionale per il modulo di ricerca della scrollbar
        override_lens = function() end,
      })
    end,
  },
}
