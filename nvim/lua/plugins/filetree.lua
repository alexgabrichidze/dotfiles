-- File tree configuration

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40,
        side = "left",
        preserve_window_proportions = true,
      },
      filters = {
        dotfiles = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      renderer = {
        root_folder_label = ":~",
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
  end,
}

