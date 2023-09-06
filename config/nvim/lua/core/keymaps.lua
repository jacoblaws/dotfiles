local M = {}

M.neo_tree = {
  plugin = true,

  n = {
    ['<leader>e'] = {
      function()
        require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      'Toggle Explorer',
    },
    ['<leader>o'] = {
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      'Focus Explorer',
    },
  },
}

return M
