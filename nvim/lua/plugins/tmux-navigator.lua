-- Vim-tmux-navigator configuration

return {
	"christoomey/vim-tmux-navigator",
	keys = {
		{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>" },
		{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>" },
		{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>" },
		{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>" },
		{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>" },
	},
}
