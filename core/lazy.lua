-- installing lazy.nvim (plugin manager)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

  -- aesthetics

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  'nvim-tree/nvim-web-devicons',

  -- set lualine as statusline

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- treesitter (syntax highlighter)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- lsp 
  {
    'neovim/nvim-lspconfig', -- core lsp functionality
    dependencies = {
      'williamboman/mason.nvim', -- lsp package manager
      'williamboman/mason-lspconfig.nvim', -- bridge between mason and lspconfig
    },
  },

  -- completion
  {
    'hrsh7th/nvim-cmp', -- completion engine
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- lsp source
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-path', -- file path completions
      'saadparwaiz1/cmp_luasnip', -- snippet completions (luasnip)
    },
  },


  -- snippets
  {
    'L3MON4D3/LuaSnip',
    keys = function()
      return {}
    end
  },

  {
    "windwp/nvim-autopairs"
  },

  -- tabout
  {
    'abecodes/tabout.nvim',
    event = 'InsertCharPre',
    priority = 1000,
  },

})
