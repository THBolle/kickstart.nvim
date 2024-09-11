-- Configures bottom statusline

-- Exposes the screenkey get_key() function so that it can be used in the statusline
vim.g.screenkey_statusline_component = true
-- vim.keymap.set('n', '<leader>ssc', function()
--   vim.g.screenkey_statusline_component = not vim.g.screenkey_statusline_component
-- end, { desc = 'Toggle screenkey statusline component' })

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        -- options = {
        --   -- theme = 'gruvbox',
        -- },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = {
            function()
              return require('screenkey').get_keys() -- Show typed keys in the statusline
            end,
            'selectioncount',
            'searchcount',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
  {
    'NStefan002/screenkey.nvim',
    lazy = false,
    version = '*', -- or branch = "dev", to use the latest commit
    config = function()
      require('screenkey').setup {
        -- clear_after = 2,
        group_mappings = true,
      }
    end,
  },
}
