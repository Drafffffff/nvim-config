local status, neosolarized = pcall(require, "neosolarized")
if not status then
  vim.notify("not neosolarized")
  return
end
neosolarized.setup({
  comment_italics = true,
  background_set = false,
})
