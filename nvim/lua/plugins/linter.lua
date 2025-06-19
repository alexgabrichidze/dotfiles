-- Linter configuration

return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "flake8" },
            lua = { "luacheck" },
            cpp = { "cpplint" },
            c = { "cpplint" },
            java = { "checkstyle" },
            sh = { "shellcheck" },
            bash = { "shellcheck" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function(args)
                local ft = vim.bo[args.buf].filetype
                if lint.linters_by_ft[ft] then
                    lint.try_lint()
                end
            end,
        })

        vim.api.nvim_create_user_command("Lint", function()
            lint.try_lint()
        end, {})

        vim.api.nvim_create_user_command("LintInfo", function()
            local ft = vim.bo.filetype
            local linters = lint.linters_by_ft[ft]
            if linters and #linters > 0 then
                print("Linters for " .. ft .. ": " .. table.concat(linters, ", "))
            else
                print("No linters configured for filetype: " .. ft)
            end
        end, {})
    end,
}
