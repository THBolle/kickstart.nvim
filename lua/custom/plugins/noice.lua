return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
        progress = {
          enabled = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- position the cmdline and popupmenu together
        -- command_palette = {
        --   views = {
        --     cmdline_popup = {
        --       position = {
        --         row = '50%',
        --         col = '50%',
        --       },
        --       -- size = {
        --       --   min_width = 60,
        --       --   width = 'auto',
        --       --   height = 'auto',
        --       -- },
        --     },
        --     -- uncomment lines below if not used nvim-cmp as backend
        --     cmdline_popupmenu = {
        --       position = 'auto',
        --       -- position = {
        --       -- row = 'auto',
        --       -- col = '50%',
        --       -- },
        --       -- size = 'auto',
        --     },
        --   },
        -- },
        -- command_palette = true,
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      cmdline = {
        view = 'cmdline_popup',
        format = {
          cmdline = false,
          -- help = false,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
}
