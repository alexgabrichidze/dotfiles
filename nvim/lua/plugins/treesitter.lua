-- Treesitter configuration

local ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "java",
    "json",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = function()
        require("nvim-treesitter").install(ensure_installed):wait(300000)
    end,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
        },
    },
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()

        local installed = {}
        for _, parser in ipairs(treesitter.get_installed("parsers")) do
            installed[parser] = true
        end

        local missing = {}
        for _, parser in ipairs(ensure_installed) do
            if not installed[parser] then
                table.insert(missing, parser)
            end
        end
        if #missing > 0 then
            treesitter.install(missing)
        end

        local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = ensure_installed,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local textobjects = {
            af = { "@function.outer", "Select function outer" },
            ["if"] = { "@function.inner", "Select function inner" },
            ac = { "@class.outer", "Select class outer" },
            ic = { "@class.inner", "Select class inner" },
            ap = { "@parameter.outer", "Select parameter outer" },
            ip = { "@parameter.inner", "Select parameter inner" },
            al = { "@loop.outer", "Select loop outer" },
            il = { "@loop.inner", "Select loop inner" },
            acond = { "@conditional.outer", "Select conditional outer" },
            icond = { "@conditional.inner", "Select conditional inner" },
            ab = { "@block.outer", "Select block outer" },
            ib = { "@block.inner", "Select block inner" },
        }

        for lhs, mapping in pairs(textobjects) do
            vim.keymap.set({ "x", "o" }, lhs, function()
                select.select_textobject(mapping[1], "textobjects")
            end, { desc = mapping[2] })
        end
    end,
}
