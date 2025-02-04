-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>hm',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon [M]ark',
    },
    {
      '<leader>ha',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[H]arpoon [A]ll Menu List',
    },
    {
      '<leader>hn',
      function()
        require('harpoon'):list():next()
      end,
      desc = '[N]ext [H]arpoon Mark',
    },
    {
      '<leader>hp',
      function()
        require('harpoon'):list():prev()
      end,
      desc = '[P]revious [H]arpoon Mark',
    },
  },
}
