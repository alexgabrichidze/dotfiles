-- Colorscheme configuration

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        nvimtree = true,
        dropbar = true,
        bufferline = true,
	notify = true,
	telescope = {
	    enabled = true,
	},
	cmp = true
      },
        highlight_overrides = {
        all = function(colors)
          return {
            MsgArea = { bg = colors.mantle, fg = colors.text },
            MsgSeparator = { bg = colors.mantle },
          }
        end,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

