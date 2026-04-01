return {
	{
		"folke/tokyonight.nvim",
		config = function()
			-- vim.cmd.colorscheme("tokyonight-night")
		end,
	},
    {
        "ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
    }
}
