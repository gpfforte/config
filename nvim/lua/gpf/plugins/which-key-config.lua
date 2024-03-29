-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    -- document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
      ['<leader>o'] = { name = '[O]rg Mode', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = '[X]Trouble', _ = 'which_key_ignore' },
    }
  end
}

