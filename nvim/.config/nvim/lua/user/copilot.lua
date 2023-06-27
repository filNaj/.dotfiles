-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }

-- since most are enabled by default you can turn them off
-- using this table and only enable for a few filetypes
-- vim.g.copilot_filetypes = { ["*"] = false, python = true }


--map <silent><script><expr> <C-q> copilot#Accept("\<CR>")
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-Q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true })

-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)


vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

--https://www.reddit.com/r/neovim/comments/sk70rk/using_github_copilot_in_neovim_tab_map_has_been/  for more information about Tab issue 
