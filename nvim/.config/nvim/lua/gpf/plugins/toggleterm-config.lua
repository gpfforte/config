local terminale = "zsh"
if vim.loop.os_uname().sysname == "Windows_NT" then
  terminale = "powershell"
else
  -- Usiamo il percorso assoluto per evitare che non trovi l'eseguibile su Arch
  terminale = vim.fn.executable("/bin/zsh") == 1 and "/bin/zsh" or "/usr/bin/zsh"
end

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = 'float',
      close_on_exit = true,
      shell = terminale,
      auto_scroll = true,
      float_opts = {
        border = 'curved',
        width = 120,
        height = 40,
        winblend = 3,
        zindex = 1,
      },
    })
  end,
}
