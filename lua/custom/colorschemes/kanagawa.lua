return {
  {
    'rebelot/kanagawa.nvim',
    config = function()
      -- Default options:
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {
            sumiInk0 = '#000000',
            fujuWhite = '#FFFFFF',
          },
          theme = {
            wave = {
              ui = {
                bg_gutter = 'none',
                float = 'none',
              },
            },
            lotus = {},
            dragon = {},
            all = {
              -- ui = { bg_gutter = 'none' },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            -- NormalFloat = { bg = 'none' },
            -- FloatBorder = { bg = 'none' },
            -- FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- NormalDark = { fg = theme.ui.fg_dim, bg = sumiInk6 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        theme = 'wave', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }

      -- setup must be called before loading
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
