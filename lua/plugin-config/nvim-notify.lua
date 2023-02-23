local status, notify = pcall(require, "notify")
if not status then
  vim.notify("没有找到 nvim-notify")
  return
end

notify.setup({
  stages = "fade_in_slide_out",
  background_colour = "#334422",
  timeout = 3000,
  render = "minimal",
  max_width = 10
})
vim.notify = notify
