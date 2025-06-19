-- Treesitter configuration

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Enable highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            -- Enable indentation
            indent = {
                enable = true,
            },

            -- Auto-install missing parsers
            auto_install = true,

            -- Install these language parsers
            ensure_installed = {
                "lua",
                "vim",
                "bash",
                "java",
                "json",
                "html",
                "css",
                "javascript",
                "typescript",
            },

            -- Incremental selection config
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss",
                    node_incremental = "<leader>si",
                    scope_incremental = "<leader>sc",
                    node_decremental = "<leader>sd",
                },
            },

            -- Text objects config
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- Functions
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        -- Classes
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        -- Parameters
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",

                        -- Loops
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- Conditionals (e.g., if/else)
                        ["acond"] = "@conditional.outer",
                        ["icond"] = "@conditional.inner",

                        -- Blocks (e.g., {} or do/end)
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },
                },
            },
        })
    end,
}
