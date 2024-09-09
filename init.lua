-- [[
-- Setup initial configuration
--
-- Primarily just download and execute lazy.nvim
-- ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy
--  To update plugins you can run
--    :Lazy update

-- set up lazy, and load lua/custom/plugins folder
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Colorschemes
  -- require 'custom/colorschemes/tokyonight',
  -- require 'custom/colorschemes/catppuccin',
  require 'custom/colorschemes/kanagawa',

  -- Plugins
  require 'custom/plugins/gitsigns',
  require 'custom/plugins/which-key',
  require 'custom/plugins/telescope',
  require 'custom/plugins/conform',
  require 'custom/plugins/cmp',
  require 'custom/plugins/todo-comments',
  require 'custom/plugins/mini',
  require 'custom/plugins/treesitter',
  -- require 'custom/plugins/debug',
  require 'custom/plugins/lint',
  require 'custom/plugins/autopairs',
  require 'custom/plugins/noice',
  -- require 'custom/plugins/hardtime',
  require 'custom/plugins/lualine',

  -- LSP servers, Typescript
  require 'custom/plugins/lsp/lspconfig',
  -- require 'custom/plugins/lsp/typescript-tools',

  -- Appearance
  require 'custom.plugins.appearance.ccc', -- Adds color picker
  require 'custom.plugins.appearance.satellite', -- Adds scrollbar with information
  require 'custom.plugins.appearance.indent_line', -- Add indentation guides even on blank lines

  -- Folds
  -- require 'custom/plugins/nvim-ufo',

  -- File structure, both of these are not needed
  require 'custom/plugins/oil',
  require 'custom/plugins/neo-tree',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
