-- Session restoration configuration

return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- load early to allow auto-save/restore
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/",
		options = { "buffers", "curdir", "tabpages", "winsize" },
	},
}
