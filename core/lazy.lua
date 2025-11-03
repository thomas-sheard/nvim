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

  -- oil (explorer)
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- telescope (search)

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- versioning:                 , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
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

  --  {
    --    'evesdropper/luasnip-latex-snippets.nvim'
    --  },

    {
      "windwp/nvim-autopairs"
    },

    -- tabout
    {
      'abecodes/tabout.nvim',
      event = 'InsertCharPre',
      priority = 1000,
    },

    -- vimtex
    {
      "lervag/vimtex",
      lazy = false,
      init = function()
        vim.g.vimtex_view_method = 'zathura' -- default pdf viewer
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_view_forward_search_on_start = false
      end
    },

    -- r for uni
    {
      "R-nvim/R.nvim",
      -- Only required if you also set defaults.lazy = true
      lazy = false,
      -- R.nvim is still young and we may make some breaking changes from time
      -- to time (but also bug fixes all the time). If configuration stability
      -- is a high priority for you, pin to the latest minor version, but unpin
      -- it and try the latest version before reporting an issue:
      -- version = "~0.1.0"
      config = function()
        -- Create a table with the options to be passed to setup()
        ---@class RConfigUserOpts
        local opts = {
          hook = {
            on_filetype = function()
              --vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
              --vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
            end
          },
          R_args = {"--quiet", "--no-save"},
          min_editor_width = 72,
          rconsole_width = 78,
          objbr_mappings = { -- Object browser keymap
            c = 'class', -- Call R functions
            ['<localleader>gg'] = 'head({object}, n = 15)', -- Use {object} notation to write arbitrary R code.
            v = function()
              -- Run lua functions
              require('r.browser').toggle_view()
            end
          },
          disable_cmds = {
            "RClearConsole",
            "RCustomStart",
            "RSPlot",
            "RSaveClose",
          },
        }
        -- Check if the environment variable "R_AUTO_START" exists.
        -- If using fish shell, you could put in your config.fish:
        -- alias r "R_AUTO_START=true nvim"
        if vim.env.R_AUTO_START == "true" then
          opts.auto_start = "on startup"
          opts.objbr_auto_start = true
        end
        require("r").setup(opts)
      end,
    },

    {
      "R-nvim/cmp-r",
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require("cmp").setup({ sources = {{ name = "cmp_r" }}})
          require("cmp_r").setup({})
        end,
      },
    },

    -- python and jupyter for uni,,, :( 
    {
      "benlubas/molten-nvim",
      version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
      build = ":UpdateRemotePlugins",
      init = function()
        --vim.g.molten_output_win_max_height = 12
      end,
    },

  })
