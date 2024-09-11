-- Create Color Code picker
return {
  'uga-rosa/ccc.nvim',
  keys = {
    { '<leader>#', vim.cmd.CccPick, desc = ' Color Picker' },
  },
  ft = { 'css', 'zhs', 'lua', 'toml' },
  config = function(spec)
    local ccc = require 'ccc'

    ccc.setup {
      highlighter = {
        filetypes = spec.ft,
        auto_enable = true,
        lsp = true,
        update_insert = true,
      },

      alpha_show = 'show',

      inputs = {
        ccc.input.hsl,
        ccc.input.rgb,
        ccc.input.cmyk,
      },

      outputs = {
        ccc.output.css_hsl,
        ccc.output.css_rgb,
        ccc.output.hex,
      },

      lsp = true,

      pickers = {
        ccc.picker.hex_long, -- Only long hex to not pick issue numbers like #123
        ccc.picker.css_rgb,
        ccc.picker.css_hsl,
        -- ccc.picker.css_name, -- Color strings like 'blue', 'red', etc.
        ccc.picker.defaults,
      },

      recognize = {
        input = true,
        output = true,
      },

      disable_default_mappings = true,
      mappings = {
        ['<C-y>'] = ccc.mapping.complete,

        -- These key mappings to not work as inteded?
        -- ['<C-n>'] = ccc.mapping.goto_head,
        -- ['<C-p>'] = ccc.mapping.goto_tail,

        ['<CR>'] = ccc.mapping.complete,
        ['<Esc>'] = ccc.mapping.quit,
        ['q'] = ccc.mapping.quit,
        ['l'] = ccc.mapping.increase1,
        ['h'] = ccc.mapping.decrease1,
        ['L'] = ccc.mapping.increase10,
        ['H'] = ccc.mapping.decrease10,
        ['o'] = ccc.mapping.cycle_output_mode,
        ['i'] = ccc.mapping.cycle_input_mode,
        ['a'] = ccc.mapping.toggle_alpha,
      },
    }
  end,
}
