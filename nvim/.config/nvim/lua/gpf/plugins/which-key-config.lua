-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    -- document existing key chains
    require('which-key').register 
    {
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

  -- {
  -- { "<leader>b", group = "[B]uffer" },
  -- { "<leader>b_", hidden = true },
  -- { "<leader>c", group = "[C]ode" },
  -- { "<leader>c_", hidden = true },
  -- { "<leader>d", group = "[D]ocument" },
  -- { "<leader>d_", hidden = true },
  -- { "<leader>f", group = "[F]ile" },
  -- { "<leader>f_", hidden = true },
  -- { "<leader>g", group = "[G]it" },
  -- { "<leader>g_", hidden = true },
  -- { "<leader>l", group = "[L]sp" },
  -- { "<leader>l_", hidden = true },
  -- { "<leader>o", group = "[O]rg Mode" },
  -- { "<leader>o_", hidden = true },
  -- { "<leader>r", group = "[R]ename" },
  -- { "<leader>r_", hidden = true },
  -- { "<leader>s", group = "[S]earch" },
  -- { "<leader>s_", hidden = true },
  -- { "<leader>w", group = "[W]indow" },
  -- { "<leader>w_", hidden = true },
  -- { "<leader>x", group = "[X]Trouble" },
  -- { "<leader>x_", hidden = true },
  -- }



  end
}

