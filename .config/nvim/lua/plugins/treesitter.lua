return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'c', 'lua', 'python', 'tsx', 'typescript', 'vimdoc', 'vim', 'markdown', 'vue', 'css', 'scss', 'c_sharp' },

            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
  },
}
