-- Formatter configuration

return {
    "stevearc/conform.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "isort", "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                java = { "google-java-format" },
                lua = { "stylua" },
                sh = { "shfmt" },
                bash = { "shfmt" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
                stop_after_first = true,
            },

            default_format_opts = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },

            notify_on_error = true,
            notify_no_formatters = true,

            log_level = vim.log.levels.ERROR,
        })

        vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
}
