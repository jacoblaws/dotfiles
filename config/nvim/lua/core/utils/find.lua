local M = {}

function M.marks()
  require('telescope.builtin').marks()
end

function M.all_files()
  require('telescope.builtin').find_files {
    hidden = true,
    no_ignore = true,
  }
end

function M.buffers()
  require('telescope.builtin').buffers()
end

function M.commands()
  require('telescope.builtin').commands()
end

function M.under_cursor()
  require('telescope.builtin').grep_string()
end

function M.files()
  require('telescope.builtin').find_files()
end

function M.highlights()
  require('telescope.builtin').highlights()
end

function M.help()
  require('telescope.builtin').help_tags()
end

function M.keymaps()
  require('telescope.builtin').keymaps()
end

function M.man_pages()
  require('telescope.builtin').man_pages()
end

function M.prev_search()
  require('telescope.builtin').resume()
end

function M.old_files()
  require('telescope.builtin').oldfiles()
end

function M.registers()
  require('telescope.builtin').registers()
end

function M.themes()
  require('telescope.builtin').colorscheme { enable_preview = true }
end

function M.words_all_files()
  require('telescope.builtin').live_grep {
    additional_args = function(args)
      vim.list_extend(args, { "--hidden", "--no-ignore" })
    end
  }
end

function M.words()
  require('telescope.builtin').live_grep()
end

return M
