--TOKYONIGHT CONFIGURATION
 --light, moon, "storm", "night", "day" 
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent = false
-- vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_transparent_sidebar = true


vim.g.tokyonight_colors = {
  -- fg = "#DEDDDD", --text color 839496
  fg = "#FFFFFF", -- black text color when bg is white
  fg_dark = "#DEDDDD", --Normal mode text like :wq
  -- fg_gutter = "#839496", --side line numbers color 979797 808080 636363 grey, 073642 greenish
  fg_gutter = "#44486a", --side line numbers color 979797 808080 636363 grey, 073642 greenish
  -- bg_highlight = "#002b36", --line highlight
  bg_highlight = "#3d3c3c", --line highlight
  -- bg_highlight = "#262b3c", --line highlight
  

  comment = "#586e75",
  blue = "#268bd2",
    cyan = "#2aa198",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
  yellow = "#b58900",
  orange = "#cb4b16",
  magenta = "#d33682",
  purple = "#6c71c4",
}

vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme darkplus]]
