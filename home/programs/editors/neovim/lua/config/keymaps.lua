local map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc or ''
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore start

-- General -----------------------------------------------------------------------------------------
-- Better up/down navigation
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', 'Down', { expr = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', 'Up',   { expr = true })

-- Copy/paste with system clipboard
map({ 'n', 'x' }, 'gy', '"+y', 'Copy to system clipboard')
map('n',          'gy', '"+y', 'Paste from system clipboard')

-- Better visual-mode indentation
map('v', '<', '<gv', 'Indent left')
map('v', '>', '>gv', 'Indent right')

-- Move between windows with <Ctrl> - {hjkl}
map('n', '<C-h>', '<c-w>h', 'Go to left window',  { remap = true })
map('n', '<C-j>', '<c-w>j', 'Go to lower window', { remap = true })
map('n', '<C-k>', '<c-w>k', 'Go to upper window', { remap = true })
map('n', '<C-l>', '<c-w>l', 'Go to right window', { remap = true })

-- Resize windows with <Ctrl> - {←↓↑→}
map('n', '<C-Left>',  '"<cmd>vertical resize -" . v:count1 . "<cr>"', 'Decrease window width',  { expr = true, replace_keycodes = false })
map('n', '<C-Down',   '"<cmd>resize -"          . v:count1 . "<cr>"', 'Decrease window height', { expr = true, replace_keycodes = false })
map('n', '<C-Up>',    '"<cmd>resize +"          . v:count1 . "<cr>"', 'Increase window height', { expr = true, replace_keycodes = false })
map('n', '<C-Right>', '"<cmd>vertical resize +" . v:count1 . "<cr>"', 'Increase window width',  { expr = true, replace_keycodes = false })

-- <Leader> Keymaps --------------------------------------------------------------------------------
map('n', '<leader>_', '<C-w>s', '󰤼 Horizontal split')
map('n', '<leader>|', '<C-w>v', '󰤻 Vertical split')

-- Toggle
map('n', '<leader>tc', '<cmd>setlocal cursorline!<cr>',     'cursorline')
map('n', '<leader>tC', '<cmd>setlocal cursorcolumn!<cr>',   'cursorcolumn')
map('n', '<leader>tl', '<cmd>setlocal list!<cr>',           'list')
map('n', '<leader>tn', '<cmd>setlocal number!<cr>',         'numbers')
map('n', '<leader>tr', '<cmd>setlocal relativenumber!<cr>', 'relativenumber')
map('n', '<leader>ts', '<cmd>setlocal spell!<cr>',          'spell')
map('n', '<leader>tw', '<cmd>setlocal wrap!<cr>',           'wrap')

-- stylua: ignore end
