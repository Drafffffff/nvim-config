local status, Colorizer = pcall(require, "colorizer")

if not status then
  vim.notify("no colorizer")
  return
end

Colorizer.setup({
  "*", -- Highlight all files, but customize some others.
  css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
  html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
