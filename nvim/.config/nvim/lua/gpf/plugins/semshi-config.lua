return

{
  "numirias/semshi",
  ft = "python",
  build = ":UpdateRemotePlugins",
  init = function()
    -- Disabled these features better provided by LSP or other more general plugins
    vim.g["semshi#always_update_all_highlights"] = true
    -- vim.g["semshi#error_sign"] = false
    -- vim.g["semshi#simplify_markup"] = false
    -- vim.g["semshi#mark_selected_nodes"] = false
    -- vim.g["semshi#update_delay_factor"] = 0.001
    --
    -- This autocmd must be defined in init to take effect
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
      group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
      callback = function()
        -- Only add style, inherit or link to the LSP's colors
        vim.cmd([[
          highlight! semshiGlobal gui=italic
          highlight! link semshiImported @none
          " highlight! link semshiParameter @lsp.type.parameter
          " highlight! link semshiParameterUnused DiagnosticUnnecessary
          " highlight! link semshiBuiltin @function.builtin
          " highlight! link semshiAttribute @field
          " highlight! link semshiSelf @lsp.type.selfKeyword
          " highlight! link semshiUnresolved @lsp.type.unresolvedReference
          " highlight! link semshiFree @none
            hi def semshiLocal           ctermfg=209 guifg=#f07199
            hi def semshiFree            ctermfg=218 guifg=#d1b0cc
            " hi def semshiSelected        ctermfg=231 guifg=#f03139 ctermbg=161 guibg=#131314
            hi def semshiSelected        ctermbg=161 guibg=#555555
            hi def semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
            hi def semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
            sign define semshiError text=E> texthl=semshiErrorSign

            hi semshiParameter       ctermfg=75  guifg=#5fafff
            hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
            hi semshiSelf            ctermfg=249 guifg=#b2b2b2


          ]])
      end,
    })
  end,
}

