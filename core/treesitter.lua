vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {

    -- languages treesitter should definitely have installed
    ensure_installed = {'c', 'cpp', 'cmake', 'lua', 'python', 'r', 'rust', 'vimdoc', 'vim', 'bash', 'java', 'latex', 'query', 'html', 'markdown'},

    auto_install = true, -- auto-install missing buffers (set false if tree-sitter is not locally installed)
    sync_install = false, -- install ensure_installed synchronously
    ignore_install = {}, -- parsers to ignore

    modules = {
      highlight = {
        enable = true,
        disable = {}, -- parsers to disable highlighting
      },
      indent = { enable = true },

      -- syntax-tree based incremental scope selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>', -- self explanatory
          node_incremental = '<c-space>', -- 
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
    },

  }
end, 0)
