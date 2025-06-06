-- Autocompletion configuration

return {
  -- Completion engine
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",

    -- Snippet engine
    "L3MON4D3/LuaSnip",

    -- Autopairs integration
    "windwp/nvim-autopairs",
  },
  config = function()
    local cmp = require("cmp")

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("nvim-autopairs").setup({})
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      }),
      formatting = {
        format = function(entry, vim_item)
          local source_names = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
            luasnip = "[Snippet]",
          }
          vim_item.menu = source_names[entry.source.name] or entry.source.name
          return vim_item
        end,
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
}
