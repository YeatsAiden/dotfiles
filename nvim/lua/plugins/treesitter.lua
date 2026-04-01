return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'master',
  auto_install = true,
  opts = {
      ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "typst" },
  },
  config = function(_, opts)
      if #opts.ensure_installed > 0 then
          for _, parser in ipairs(opts.ensure_installed) do
              vim.api.nvim_create_autocmd({ "FileType" }, {
                  pattern = parser,
                  callback = function(event)
                      vim.treesitter.start(event.buf, parser)
                  end,
              })
          end
      end
  end
}
