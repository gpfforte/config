-- Useful plugin to show you pending keybinds.
-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>b",  group = "[B]uffer" },
      { "<leader>b_", hidden = true },
      { "<leader>c",  group = "[C]ode" },
      { "<leader>c_", hidden = true },
      { "<leader>d",  group = "[D]ocument" },
      { "<leader>d_", hidden = true },
      { "<leader>f",  group = "[F]ile" },
      { "<leader>f_", hidden = true },
      { "<leader>g",  group = "[G]it" },
      { "<leader>g_", hidden = true },
      { "<leader>l",  group = "[L]sp" },
      { "<leader>l_", hidden = true },
      { "<leader>o",  group = "[O]rg Mode" },
      { "<leader>o_", hidden = true },
      { "<leader>r",  group = "[R]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>s",  group = "[S]earch" },
      { "<leader>s_", hidden = true },
      { "<leader>w",  group = "[W]indow" },
      { "<leader>w_", hidden = true },
      { "<leader>x",  group = "[X]Trouble" },
      { "<leader>x_", hidden = true },
    },
  },
}
