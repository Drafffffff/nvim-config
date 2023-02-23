local status, Flit = pcall(require, "flit")

if not status then
  vim.notify("no flit")
  return
end

Flit.setup({

  keys = { f = "f", F = "F", t = "t", T = "T" },

  -- A string like "nv", "nvo", "o", etc.

  labeled_modes = "v",

  multiline = true,

  opts = {},
})
