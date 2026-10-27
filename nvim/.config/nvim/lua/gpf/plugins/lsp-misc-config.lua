return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim.uv" } },
          },
        },
      },
    },
    config = function()
      -- 1. Definiamo la funzione on_attach per i tasti
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [References]')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [Implementation]')
        nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[Document] Symbols')
        nmap('<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [Symbols]')

        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [Declaration]')
        nmap('<leader>la', vim.lsp.buf.add_workspace_folder, '[W]orkspace [Add] Folder')
        nmap('<leader>lr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [Remove] Folder')
        nmap('<leader>ll', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [List] Folders')

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          require('conform').format({ lsp_fallback = true })
        end, { desc = 'Format current buffer with conform.nvim' })

        -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --   vim.lsp.buf.format()
        -- end, { desc = 'Format current buffer with LSP' })
      end

      -- Autocomando globale per agganciare on_attach quando parte un LSP
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- Evita di attaccare se il client non esiste
          if client then
            on_attach(client, args.buf)
          end
        end,
      })

      -- 2. Setup di Mason e Mason-Lspconfig
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'pyright', 'lua_ls' },
      })

      -- 3. Configurazione nativa Neovim 0.11+ (Sostituisce require('lspconfig'))
      -- Configuriamo le opzioni specifiche per lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Abilitiamo i server installati con Mason
      vim.lsp.enable('pyright')
      vim.lsp.enable('lua_ls')
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  }
}
