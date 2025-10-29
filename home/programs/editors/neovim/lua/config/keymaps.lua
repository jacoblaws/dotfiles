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
map('n', '<leader>e', '<cmd>Fyler<cr>', '󰅟 Fyler')
map('n', '<leader>_', '<C-w>s',         '󰤼 Horizontal split')
map('n', '<leader>|', '<C-w>v',         '󰤻 Vertical split')

-- Buffer
map('n', '<leader>bd', '<cmd>lua MiniBufremove.delete()<cr>',        'Delete')
map('n', '<leader>bD', '<cmd>lua MiniBufremove.delete(0, true)<cr>', 'Force Delete')

-- Find
map('n', '<leader>fb', '<cmd>lua Snacks.picker.buffers()<cr>',            'Buffers')
map('n', '<leader>fc', '<cmd>lua Snacks.picker.git_log()<cr>',            'Commits (all)')
map('n', '<leader>fC', '<cmd>lua Snacks.picker.git_log_file()<cr>',       'Commits (buf)')
map('n', '<leader>fd', '<cmd>lua Snacks.picker.diagnostics()<cr>',        'Diagnostic workspace')
map('n', '<leader>fD', '<cmd>lua Snacks.picker.diagnostics_buffer()<cr>', 'Diagnostic buffer')
map('n', '<leader>ff', '<cmd>lua Snacks.picker.files()<cr>',              'Files')
map('n', '<leader>fg', '<cmd>lua Snacks.picker.grep()<cr>',               'Grep live')
map('n', '<leader>fG', '<cmd>lua Snacks.picker.grep_word()<cr>',          'Grep word')
map('n', '<leader>fh', '<cmd>lua Snacks.picker.help()<cr>',               'Help tags')
map('n', '<leader>fH', '<cmd>lua Snacks.picker.highlights()<cr>',         'Highlight groups')
map('n', '<leader>fk', '<cmd>lua Snacks.picker.keymaps()<cr>',            'Keymaps')
map('n', '<leader>fm', '<cmd>lua Snacks.picker.man()<cr>',                'Man Pages')
map('n', '<leader>fr', '<cmd>lua Snacks.picker.recent()<cr>',             'Recent')
map('n', '<leader>f/', '<cmd>lua Snacks.picker.search_history()<cr>',     'Search History')
map('n', '<leader>f:', '<cmd>lua Snacks.picker.command_history()<cr>',    'Command History')

-- Git
map('n', '<leader>gb', '<cmd>lua Snacks.picker.git_log_line()<cr>', 'Blame line')
map('n', '<leader>gd', '<cmd>lua MiniDiff.toggle_overylay()<cr>',   'Diff')
map('n', '<leader>gf', '<cmd>lua Snacks.picker.git_log_file()<cr>', 'File history')
map('n', '<leader>gg', '<cmd>lua Snacks.lazygit()<cr>',             'LazyGit')
map('n', '<leader>gl', '<cmd>lua Snacks.picker.git_log()<cr>',      'Log (cwd)')

-- Language
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>',     'Actions')
map('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<cr>',   'Diagnostics')
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>',  'Implementation')
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>',           'Hover')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>',          'Rename')
map('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<cr>',      'References')
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.definition()<cr>',      'Source definition')
map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type Definition')

-- Toggle
map('n', '<leader>tc', '<cmd>setlocal cursorline!<cr>',     'cursorline')
map('n', '<leader>tC', '<cmd>setlocal cursorcolumn!<cr>',   'cursorcolumn')
map('n', '<leader>tD', '<cmd>lua Snacks.dim()<cr>',         'Dimming')
map('n', '<leader>tl', '<cmd>setlocal list!<cr>',           'list')
map('n', '<leader>tn', '<cmd>setlocal number!<cr>',         'numbers')
map('n', '<leader>tr', '<cmd>setlocal relativenumber!<cr>', 'relativenumber')
map('n', '<leader>ts', '<cmd>setlocal spell!<cr>',          'spell')
map('n', '<leader>tw', '<cmd>setlocal wrap!<cr>',           'wrap')

-- stylua: ignore end
