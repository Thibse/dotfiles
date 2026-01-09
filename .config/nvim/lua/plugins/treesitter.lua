return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = "main"
      },
    },
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install = { 'c', 'lua', 'python', 'tsx', 'typescript', 'vimdoc', 'vim', 'markdown', 'vue', 'css', 'scss', 'c_sharp' }
    end
  },
}
