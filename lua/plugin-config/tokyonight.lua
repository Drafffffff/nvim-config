local status, tokyonight = pcall(require, "tokyonight")
if not status then
  vim.notify("没有找到 tokyonight")
  return
end
tokyonight.setup({
  style = "moon",
  -- The theme comes in three styles, `storm`, `moon`, a
  -- darker variant `night` and `day`
  transparent = true,
  -- Enable this to disable setting the background color
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`

    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
  },
  on_colors = function(c)
    c.bg_highlight = "#4c4197"
  end,
})
