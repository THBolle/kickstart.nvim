local set = vim.keymap.set
local k = vim.keycode

-- [[ Basic keymaps ]]
-- see :help vim.keymap.set()

-- Movement keybinds for navigating splits
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- These mappings control the size of splits (height/width)
set('n', '<M-<>', '<C-w>5<')
set('n', '<M->>', '<C-w>5>')
set('n', '<M-t>', '<C-w>+')
set('n', '<M-s>', '<C-w>-')

-- Execute the current file
set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })

-- Clear highlight on search when pressing <ESC> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
