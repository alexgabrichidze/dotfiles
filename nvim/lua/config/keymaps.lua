-- Keymaps configuration

-- Leader key (spacebar)
vim.g.mapleader = " "

-- Window navigation keybindings
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to lower window" })

-- Open plugin menu keybinding
vim.keymap.set("n", "<leader>pm", function()
  require("lazy").show()
end, { desc = "Open Lazy Plugin Manager" })

-- Open Oil.nvim keybinding
vim.keymap.set("n", "<leader>o", function()
  require("oil").open()
end, { desc = "Open Oil file explorer" })

-- Buffer closure 
vim.keymap.set("n", "<leader>q", function()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_get_option(buf, "buflisted")
  end, vim.api.nvim_list_bufs())

  if #bufs <= 1 then
    vim.cmd("confirm q") -- Quit Neovim if this is the last buffer
  else
    vim.cmd("bnext")     -- Switch to next buffer
    vim.cmd("bd#")       -- Delete the previous one (which is now #)
  end
end, { desc = "Close buffer and switch to next" })

-- Next buffer
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Previous buffer
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
