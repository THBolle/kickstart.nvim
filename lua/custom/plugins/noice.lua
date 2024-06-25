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
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false,
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          border = {
            -- style = 'rounded',
            text = {
              top = ' Command ',
            },
          },
          position = {
            row = math.floor((vim.o.lines / 2)),
            col = '50%',
          },
          filter_options = {},
          win_options = {
            -- winhighlight = { Normal = 'Normal', FloatBorder = 'Normal' },
          },
          size = {
            width = 60,
            height = 1,
          },
        },
        popupmenu = {
          relative = 'editor',
          position = {
            row = math.floor((vim.o.lines / 2) + 3),
            col = '50%',
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = 'rounded',
          },
          win_options = {
            winhighlight = { Normal = 'Normal', FloatBorder = 'Float' },
          },
        },
      },
      cmdline = {
        view = 'cmdline_popup',
        opts = {},
        format = {
          -- conceal = false,
          cmdline = false,
          lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
          -- input = {},
        },
      },
      message = {
        enabled = true,
        view_warn = 'notify',
        view = 'notify',
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
