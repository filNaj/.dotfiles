local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
  },
  highlights = {
    fill = {
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = { -- color of text
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "TabLineSel" },
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },

    modified = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
    --   guifg = { attribute = "bg", highlight = "#000000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      guifg = "#1F2732", -- Set your desired foreground color
      -- guibg = "NONE",    -- Remove the background color
    },

    separator_selected = {
      -- guifg = { attribute = "bg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
      guifg = "#1F2732", -- Set your desired foreground color
      -- guibg = "NONE",    -- Remove the background color
    },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
