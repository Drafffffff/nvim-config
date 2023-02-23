local status, modes = pcall(require, "modes")

if not status then
  vim.notify("not modes")
  return
end

modes.setup({
  colors = {
    copy = "#f5c359",
    delete = "#c75c6a",
    insert = "#00ac65",
    visual = "#ff007c",
  },

  -- Set opacity for cursorline and number background
  line_opacity = 0.60,

  -- Enable cursor highlights
  set_cursor = true,

  -- Enable cursorline initially, and disable cursorline for inactive windows
  -- or ignored filetypes
  set_cursorline = true,

  -- Enable line number highlights to match cursorline
  set_number = false,

  -- Disable modes highlights in specified filetypes
  -- Please PR commonly ignored filetypes
  ignore_filetypes = { "NvimTree", "TelescopePrompt" },
})
