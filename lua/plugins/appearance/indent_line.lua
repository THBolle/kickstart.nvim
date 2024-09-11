-- Add indentation guides even on blank lines
return {
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    -- event = 'UIEnter',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup {
        scope = {
          highlight = { 'Constant' }, -- Color of hightlighted scope, 'Special' will add blue color similar to default mini.indentscope
          char = { '╎' },
          show_start = false,
          show_end = true,
        },
        indent = {
          char = { '│' },
          tab_char = { '│' },
          -- char = { '│', '┊' },
          -- tab_char = { '│', '┊' },
        },
      }
    end,
  },

  -- Add color to the current indentscope under cursor
  -- {
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     local indentscope = require 'mini.indentscope'
  --     indentscope.setup {
  --       draw = {
  --         animation = require('mini.indentscope').gen_animation.none(),
  --       },
  --       options = {
  --         indent_at_cursor = false,
  --         try_as_border = true,
  --       },
  --     }
  --   end,
  -- },
}
