return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]epjace [)] [']
      require('mini.surround').setup()
      -- unbind vim internaj 's' keybinding
      vim.keymap.set('n', 's', '<nop>', { desc = 'surround' })
      -- vim.keymap.set('n', 'sa', '', { desc = 'surround around' })

      local wk = require 'which-key'
      wk.add {
        { 'sa', desc = '[S]urround [A]dd [X]' },
        { 'sab', desc = '[S]urround [A]dd [B]ackwards [X]' },
        { 'saw', desc = '[S]urround [A]dd [W]ord [X]' },
        { 'sae', desc = '[S]urround [A]dd [E]nd [X]' },
        { 'sai', desc = '[S]urround [A]dd [I]nner [X]' },
        { 'saiw', desc = '[S]urround [A]dd [I]nner [W]ord [X]' },
        { 'sd', desc = '[S]urround [D]elete [X]' },
        { 'sr', group = '[S]urround [R]eplace [X] [Y]' },
      }

      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      --- @diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      local indentscope = require 'mini.indentscope'
      indentscope.setup {
        draw = {
          delay = 0,
        },
      }
      -- require(mini.indentscope).gen_animation.none()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
