local actions = require ('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

require('telescope').setup{

  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next, -- <C-j> / <C-k> navigates results
        ["<C-k>"] = actions.move_selection_previous
      },
    },
  },
}

vim.keymap.set('n', '<leader>ff', function()builtin.find_files({cwd=utils.buffer_dir()})end, {}) -- ff to search files from pwd ('find files') 
vim.keymap.set('n', '<leader>fr', function()builtin.find_files({cwd='~'})end, {}) -- fr to search files from root ('find root')
vim.keymap.set('n', '<leader>fd', function()builtin.find_files({hidden=true, cwd='~'})end, {}) -- fd to search hidden files from root ('find dotfiles')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- fg to grep files in pwd ('find grep')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- fb to search buffers ('find buffers')
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- fh to search documentation ('find help')
vim.keymap.set('n', '<leader>fe', function()builtin.diagnostics({bufnr=0})end, {}) -- fe to search lsp errors ('find errors')
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {}) -- ft to search treesitter (!)
