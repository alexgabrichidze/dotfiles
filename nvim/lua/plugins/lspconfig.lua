-- Lspconfig configuration

return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach = function(_, bufnr)
            local bufmap = function(keys, fn, desc)
                if desc then
                    desc = "LSP: " .. desc
                end
                vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc })
            end

            bufmap("gd", vim.lsp.buf.definition, "Go to definition")
            bufmap("K", vim.lsp.buf.hover, "Hover documentation")
            bufmap("gr", vim.lsp.buf.references, "List references")
            bufmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
            bufmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
            bufmap("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
            bufmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
            bufmap("<leader>vd", vim.diagnostic.open_float, "Diagnostics float")
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        -- Python
        vim.lsp.config("pyright", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable("pyright")

        -- C/C++
        vim.lsp.config("clangd", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable("clangd")

        -- Java
        vim.lsp.config("jdtls", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable("jdtls")

        -- Lua
        vim.lsp.config("lua_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        -- Bash
        vim.lsp.config("bashls", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable("bashls")
    end,
}
