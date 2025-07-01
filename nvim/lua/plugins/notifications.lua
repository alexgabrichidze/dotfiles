-- Notifications configuration

return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")
    vim.notify = notify

    notify.setup({
      stages = "slide",
      timeout = 5000,
      fps = 60,
      render = "wrapped-compact",
      time_formats = {
        notification = "%m-%d-%Y %I:%M %p",
        notification_history = "%m-%d-%Y %I:%M %p",
      },
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = "single" }) -- square corners
      end,
    })
  end,
}

