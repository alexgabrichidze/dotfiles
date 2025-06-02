-- Statusline configuration

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "catppuccin/nvim" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "filetype" }, 
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

