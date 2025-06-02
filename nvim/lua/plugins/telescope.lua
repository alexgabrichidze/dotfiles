-- Telescope configuration

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local builtin = require("telescope.builtin")
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	path_display = { "smart", "truncate" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Load fzf-native extension
    telescope.load_extension("fzf")

    -- Keybindings
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Recently Opened Files" })

    -- Open Neovim config folder keybinding
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({
        prompt_title = "Find Config Files",
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "Find Files in config/" })
  end,
}
