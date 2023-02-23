local status, transparent = pcall(require, "transparent")

if not status then
  vim.notify("没有找到 transparent")
  return
end
transparent.setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    --   -- In particular, when you set it to 'all', that means all available groups
    --   -- example of akinsho/nvim-bufferline.lua
    -- "BufferLineTabClose",
    -- "BufferlineBufferSelected",
    -- "BufferLineFill",
    -- "BufferLineBackground",
    -- "BufferLineSeparator",
    -- "BufferLineIndicatorSelected",
    "NotifyERRORBorder",
    "NotifyWARNBorder",
    "NotifyINFOBorder",
    "NotifyDEBUGBorder",
    "NotifyTRACEBorder",
    "NotifyERRORIcon",
    "NotifyWARNIcon",
    "NotifyINFOIcon",
    "NotifyDEBUGIcon",
    "NotifyTRACEIcon",
    "NotifyERRORTitle",
    "NotifyWARNTitle",
    "NotifyINFOTitle",
    "NotifyDEBUGTitle",
    "NotifyTRACETitle",
  },
  exclude = {}, -- table: groups you don't want to cleared
})

-- local status_ok, _ = pcall(vim.cmd, "TransparentToggle")
-- if not status_ok then
--   vim.notify("TransparentToggle fail ")
--   return
-- end
