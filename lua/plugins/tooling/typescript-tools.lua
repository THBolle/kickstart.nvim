return {
  -- 'pmizio/typescript-tools.nvim',
  -- dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  -- opts = {},

  'pmizio/typescript-tools.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    -- local lsp = require "lspconfig"

    local ok, tst = pcall(require, 'typescript-tools')
    if not ok then
      return
    end

    tst.setup {
      filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
      },
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = 'non-relative',
          -- providePrefixAndSuffixTextForRename = false,
        },
        -- tsserver_plugins = { 'typescript-plugin-css-modules' },
        -- separate_diagnostic_server = true,
        -- publish_diagnostic_on = 'insert_leave',

        -- tsserver_file_preferences = {
        --   includeInlayParameterNameHints = 'all',
        --   includeCompletionsForModuleExports = true,
        --   quotePreference = 'auto',
        -- },
        -- tsserver_format_options = {
        --   allowIncompleteCompletions = false,
        --   allowRenameOfImportPath = false,
        -- },
      },
    }

    -- require('typescript-tools').setup {}
  end,
}
