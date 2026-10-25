return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "python", "lua", "vim", "vimdoc", "c", "cpp", "javascript", "bash" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { "rust" },

        highlight = {
          enable = true,
          disable = { "rust" },
          additional_vim_regex_highlighting = true,
        },
        indent = { enable = true },

        -- Nota: il vecchio modulo 'rainbow' esterno è stato rimosso
        -- perché non più compatibile con le versioni recenti.
      }
    end
  },
}
