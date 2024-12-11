return {
{
    'rebelot/kanagawa.nvim', -- neorg needs a colorscheme with treesitter support
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    -- version = "*",
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes', -- Make sure this directory exists!
              },
              default_workspace = 'notes',
            },
          },
        },
      }

      -- These settings help with folding and concealment
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
