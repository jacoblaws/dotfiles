return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    '.git',
  },
}
