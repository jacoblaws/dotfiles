vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

-- stylua: ignore start

require('snacks').setup({
  dim     = { enabled = true }, -- Dim inactive scopes
  image   = { enabled = true }, -- Image viewer using Kitty Graphics Protocol
  lazygit = { enabled = true }, -- Open LazyGit in a floating window
  input   = { enabled = true }, -- Better vim.ui.input
  picker  = { enabled = true }, -- Picker for selecting items

  -- Indent guides and scope
  indent = {
    enabled = true,
    animate = {
      enabled = false,
    }
  },

  -- Neovim splash-screen
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = '󰝒 ', key = 'n', desc = 'New File',     action = ':ene | startinsert' },
        { icon = '󰱼 ', key = 'f', desc = 'Find Files',   action = '<cmd>lua Snacks.picker.files()<cr>' },
        { icon = '󱈖 ', key = 'r', desc = 'Recent Files', action = '<cmd>lua Snacks.picker.recent()<cr>' },
        { icon = '󰯂 ', key = 'g', desc = 'Find Text',    action = '<cmd>lua Snacks.picker.grep()<cr>' },
        { icon = '󰈇 ', key = 'q', desc = 'Quit',         action = ':qa' },
      },
    },
    sections = {
      { section = 'header' },
      { icon = '󰌌 ', title = 'Keymaps',      section = 'keys',         indent = 1, padding = 1 },
      { icon = '󰈢 ', title = 'Recent Files', section = 'recent_files', indent = 1, padding = 1 },
      { icon = '󰉓 ', title = 'Projects',     section = 'projects',     indent = 1, padding = 1 },
    },
  },

  -- Pretty vim.notify
  notifier = {
    enabled = true,
    icons = _G.Config.icons.diagnostics,
    style = 'minimal',
    top_down = false,
  },
})

--stylua: ignore end
