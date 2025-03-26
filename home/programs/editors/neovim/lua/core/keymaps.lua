local toggle = require('utils.toggle')

local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down navigation
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { desc = 'Down', expr = true })
map({ 'n', 'x' }, '<Down>', 'v:count == 0 ? "gj" : "j"', { desc = 'Down', expr = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { desc = 'Up', expr = true })
map({ 'n', 'x' }, '<Up>', 'v:count == 0 ? "gk" : "k"', { desc = 'Up', expr = true })

-- move windows with <ctrl> - {hjkl}
map('n', '<C-h>', '<c-w>h', { desc = 'Go to left window', remap = true })
map('n', '<c-j>', '<c-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<c-k>', '<c-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<c-l>', '<c-w>l', { desc = 'Go to right window', remap = true })

-- resize windows with <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- window splits
map('n', '<leader>_', '<C-w>s', { desc = 'Horizontal split' })
map('n', '<leader>|', '<C-w>v', { desc = 'Horizontal split' })

-- better visual-mode indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- add comments above/below
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add comment below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add comment above' })

-- diagnostics
map('n', '<leader>cd', function() vim.diagnostic.open_float({ border = 'rounded' }) end, { desc = 'Line diagnostic' })

-- toggle
map('n', '<leader>ub', toggle.background, { desc = 'Toggle background' })
map('n', '<leader>uc', function() toggle.option('cursorline') end, { desc = 'Toggle cursorline' })
map('n', '<leader>un', toggle.cycle_number_options, { desc = 'Toggle line numbers' })
map('n', '<leader>uw', function() toggle.option('wrap') end, { desc = 'Toggle wrap'})
map('n', '<leader>ul', toggle.virtual_lines, { desc = 'Toggle virtual lines' })
map('n', '<leader>ut', toggle.virtual_text, { desc = 'Toggle virtual text' })
