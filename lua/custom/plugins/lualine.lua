return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_x = {
          {
            -- require('noice').api.status.command.get,
            -- cond = require('noice').api.status.command.has,
            -- color = { fg = '#ff9e64' },
          },
        },
      },
    }
  end,
}
