return {
  lsp = {
    formatting = {
      timeout_ms = 3500
    }
  },

  polish = function()

    vim.g.maplocalleader = ','
    local wkl = require('which-key')


    wkl.register({
       ['±'] = {'', 'NOOP'}, -- NOOP to get local leader menu to display
    }, { prefix = '<localleader>' })

  end,

}
