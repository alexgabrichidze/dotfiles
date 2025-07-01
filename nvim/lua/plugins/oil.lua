-- Oil.nvim configuration

return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        default_file_explorer = true,

        columns = { "icon" },

        buf_options = {
          buflisted  = false,
          bufhidden  = "hide",
        },

        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },

        delete_to_trash = false,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,

        cleanup_delay_ms = 2000,

        lsp_file_methods = {
          enabled = true,
          timeout_ms = 1000,
          autosave_changes = false,
        },

        constrain_cursor = "editable",
        watch_for_changes = true,
        use_default_keymaps = true,

        view_options = {
          show_hidden = false,
          natural_order = "fast",
          case_insensitive = false,
        },
      })
    end,
  },
}
