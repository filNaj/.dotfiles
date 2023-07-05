-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--Tab out 
vim.cmd[[inoremap <expr> <Tab> search('\%#[]()>)}''"`]', 'n') ? '<Right>' : '<Tab>']]


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- New tab
keymap('n', 'te', ':tabedit')
-- Split window
keymap('n', 'ss', ':split<Return><C-w>w')
keymap('n', 'sv', ':vsplit<Return><C-w>w')

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", ",m", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)


keymap("n", "<leader>dm", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>dM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", opts)
keymap("n", "<leader>dF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>dS", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)


-- Prettier
keymap("n", "<leader>fo", ":Prettier<cr>", opts)

-- Save 
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>wq", ":wq<cr>", opts) 

-- Save all buffers
keymap("n", "<leader>wa", ":wa<cr>", opts)

-- Save in insert_mode 
keymap("i", "<C-s>", "<Esc>:w<cr>", opts)

-- Exit without saving
keymap("n", "<leader>q", ":q!<cr>", opts)

 -- Select all 
keymap("n", "<C-a>", "ggVG", opts)

-- Find and replace
keymap("n", "<leader>r", ":%s/", opts)

-- Find and replace a matched word
function replaceWord()
  local word = vim.fn.expand('<cword>')
  local newWord = vim.fn.input('Replace ' .. word .. ' with: ')
  vim.cmd(':%s/\\<' .. word .. '\\>/' .. newWord .. '/g')
end
vim.api.nvim_set_keymap('n', '<leader>rr', ':lua replaceWord()<CR>', {noremap = true, silent = true})

-- Comment out line in insert mode 
keymap("i", "<C-/>", "<Esc>:CommentToggle<cr>", opts)

-- Paste in insert mode 
keymap("i", "<C-v>", "<Esc>p", opts)

-- Reload vim files 
keymap("n", "<leader>re",":edit!<cr>", opts)

--key binding for lua vim.lsp.buf.formatting_sync()
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>", opts)


