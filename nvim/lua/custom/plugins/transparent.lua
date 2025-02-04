-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'xiyaowong/transparent.nvim',
  opts = {
    lazy = false,
    extra_groups = {
      'NormalFloat',
      'NvimTreeNormal',
      'ZenBg',
    },
  },
  vim.keymap.set('n', '<leader>tt', ':TransparentToggle<CR>', { desc = '[T]ransparent[T]oggle' }),
  require('fidget').setup {
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
  require('tokyonight').setup {
    transparent = true,
    on_highlights = function(hl, c)
      -- set telescope-bg transparent
      hl.TelescopeNormal = {
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        fg = c.bg_dark,
      }
    end,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
  --  require('telescope').setup {
  --    local tele = require('telescope.builtin')
  --    telescope.builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --       winblend = 0,
  --       previewer = false,
  --      }),
  --    },
}
