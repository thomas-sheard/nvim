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

--  {
--    'nvim-lualine/lualine.nvim',
--    opts = {
--      options = {
--        icons_enabled = false,
--        theme = 'onedark',
--        component_separators = '|',
--        section_separators = '',
--      },
--    },
--  },

  -- treesitter (syntax highlighter)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },


})
