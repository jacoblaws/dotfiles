local M = {}

local Snacks = require('snacks')

function M.all_files()
  Snacks.picker.pick('files', { hidden = true, ignored = true })
end

function M.buffers()
  Snacks.picker.buffers()
end

function M.commands()
  Snacks.picker.commands()
end

function M.command_history()
  Snacks.picker.command_history()
end

function M.files()
  Snacks.picker.files()
end

function M.git_branches()
  Snacks.picker.git_branches()
end

function M.git_diff()
  Snacks.picker.git_diff()
end

function M.git_log()
  Snacks.picker.git_log()
end

function M.git_log_file()
  Snacks.picker.git_log_file()
end

function M.git_status()
  Snacks.picker.git_status()
end

function M.grep()
  Snacks.picker.grep()
end

function M.grep_all_files()
  Snacks.picker.pick('grep', { hidden = true, ignored = true })
end

function M.help()
  Snacks.picker.help()
end

function M.highlights()
  Snacks.picker.highlights()
end

function M.keymaps()
  Snacks.picker.keymaps()
end

function M.man()
  Snacks.picker.man()
end

function M.marks()
  Snacks.picker.marks()
end

function M.recent()
  Snacks.picker.recent()
end

function M.registers()
  Snacks.picker.registers()
end

function M.resume()
  Snacks.picker.resume()
end

return M
