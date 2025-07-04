-- Bufferline configuration

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}

