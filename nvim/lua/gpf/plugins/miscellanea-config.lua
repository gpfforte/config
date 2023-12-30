return {
    { 'nvim-tree/nvim-web-devicons' },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({})
        end
    },
    { 'numToStr/Comment.nvim',      opts = {} },

    -- Start Screen
    { 'mhinz/vim-startify' },
    -- CSV colorizer
    { 'mechatroner/rainbow_csv' },
    -- Undo possibility to the top
    { 'mbbill/undotree' },
    -- Detect tabstop and shiftwidth automatically
    { 'tpope/vim-sleuth' },
    -- Better Syntax highlighting for Python

    -- Added This Plugin
    --"vim-python/python-syntax",
    --Folding
    { "tmhedberg/SimpylFold" },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- Colorize brackets
    -- { 'HiPhish/nvim-ts-rainbow2' },
    { 'sudormrfbin/cheatsheet.nvim' },
    { 'nvim-lua/popup.nvim' },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },
}

