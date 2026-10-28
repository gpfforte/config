return
{
  "kylechui/nvim-surround",
  version = "*",       -- Use for stability
  keys = { "ys", "ds", "cs", { "S", mode = "v" } },
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}
-- {
--     "kylechui/nvim-surround",
--     version = "*", -- Use for stability; omit to use `main` branch for the latest features
--     event = "VeryLazy",
--     config = function()
--         require("nvim-surround").setup({
--             -- Configuration here, or leave empty to use defaults
--         })
--     end
-- },
