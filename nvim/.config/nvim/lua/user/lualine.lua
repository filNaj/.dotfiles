-- SLANTED GAPS STYLE
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/slanted-gaps.lua
local colors = {
  red = '#ca1243',
  grey = '#262626',
  black = '#0A0A13',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = "#A9FF68",
  blue = '#208CD4',
  pink = '#F60066',
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.pink } },
  replace = { a = { fg = colors.black, bg = colors.green } },
  command = { a = { fg = colors.black, bg = colors.orange } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.grey } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
  

-- ARROW STYLE LUALINE  
-- local status_ok, lualine = pcall(require, "lualine")
-- if not status_ok then
--   return
-- end
--
-- local hide_in_width = function()
--   return vim.fn.winwidth(0) > 80
-- end
--
-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = " ", warn = " " },
--   colored = false,
--   always_visible = true,
-- }
--
-- local diff = {
--   "diff",
--   colored = false,
--   symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
--   cond = hide_in_width,
-- }
--
-- local filetype = {
--   "filetype",
--   icons_enabled = false,
-- }
--
-- local location = {
--   "location",
--   padding = 0,
-- }
--
-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end
--
-- lualine.setup {
--   options = {
--     globalstatus = true,
--     icons_enabled = true,
--     theme = "auto",
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--     disabled_filetypes = { "alpha", "dashboard" },
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = {"branch"},
--     lualine_c = { diagnostics },
--     lualine_x = { diff, spaces, "encoding", filetype },
--     lualine_y = { location },
--     lualine_z = { "progress" },
--   },
-- }
--
--
--
--
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'solarized_dark', --or 'powerline', or 'ayu...', 'horizon', 'molokai'
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
  












