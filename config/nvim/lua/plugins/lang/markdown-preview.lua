-- markdown-preview
--
-- preview markdown in a browser with synchronised scrolling

local cmd = {
  'MarkdownPreviewToggle',
  'MarkdownPreview',
  'MarkdownPreviewStop',
}

local config = function()
  vim.g.mkdp_theme = 'light'
  vim.g.mkdp_page_title = '${name}'
end

local plugin_spec = {
  'iamcco/markdown-preview.nvim',

  lazy = true,
  cmd = cmd,
  ft = 'markdown',

  build = 'cd app && npm install',
  config = config,
}
return plugin_spec
