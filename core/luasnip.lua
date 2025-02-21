local ls = require('luasnip')

ls.config.set_config({
  enable_autosnippets = true
})

-- activate a snippet

vim.keymap.set({"i", "s"}, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {silent = true})

-- tab and shift tab to navigate within a snippt
vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})


-- there are also mappings in the docs for choice nodes, but i haven't needed those yet

require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/core/luasnip/'})
