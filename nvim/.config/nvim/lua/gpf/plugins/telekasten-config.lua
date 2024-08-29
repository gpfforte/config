
return    { 'renerocksai/telekasten.nvim',
config = function()
    if vim.loop.os_uname().sysname == "Windows_NT" then
      require('telekasten').setup({
        home = vim.fn.expand("$HOME/Appdata/Local/nvim/zettelkasten"), -- Put the name of your notes directory here
      })
    else
      require('telekasten').setup({
        home = vim.fn.expand("$HOME/.config/nvim/zettelkasten"), -- Put the name of your notes directory here
      })
    end
end}
