return {
    "chomosuke/typst-preview.nvim",
    lazy = true, -- or ft = 'typst'
    ft = 'typst',
    version = "1.*",
    config = function()
        vim.keymap.set("n", "<leader>P", "<cmd>TypstPreviewToggle<CR>", { desc = "Toggle Typst Preview" })
    end,
}
