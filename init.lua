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

  ------------------ Utility ------------------
  require 'plugins.utility.mini', -- Multiple independent 'mini' lua modules
  require 'plugins.utility.gitsigns', -- Git integration
  require 'plugins.utility.which-key', -- Popup showing keybindings
  require 'plugins.utility.telescope', -- Fuzzy finder
  require 'plugins.utility.cmp', -- Autocompletion
  require 'plugins.utility.treesitter', -- Highlight, edit, and navigate code
  require 'plugins.utility.autopairs', -- Autopairing ofc
  require 'plugins.utility.ccc', -- Adds color picker
  -- require 'plugins.utility.hardtime',
  -- require 'plugins.utility.nvim-ufo', -- Folds

  ------------------ Utility ------------------
  -- File structure, both of these are not needed at the same time
  require 'plugins.utility.file-structure.oil',
  require 'plugins.utility.file-structure.neo-tree',

  ------------------ Tooling ------------------
  -- LSP servers, DAP servers, linters, and formatters with Mason interface
  require 'plugins.tooling.lspconfig', -- LSP
  -- require 'plugins.tooling.typescript-tools', -- LSP
  -- require 'plugins.tooling.debug', -- DAP
  require 'plugins.tooling.lint', -- Linter
  require 'plugins.tooling.conform', -- Formatting

  ----------------- Appearance ------------------
  require 'plugins.appearance.noice', -- Chages the UI for messages, cmdline and the popupmenu. Also adds notifications
  require 'plugins.appearance.todo-comments',
  require 'plugins.appearance.lualine', -- Configures bottom statusline
  require 'plugins.appearance.satellite', -- Adds scrollbar with information
  require 'plugins.appearance.indent_line', -- Add indentation guides even on blank lines

  ---------------- Colorscheme ------------------
  require 'colorschemes.kanagawa',
  -- require 'colorschemes/tokyonight',
  -- require 'colorschemes/catppuccin',
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
