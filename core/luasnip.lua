local ls = require('luasnip')

ls.config.set_config({
  enable_autosnippets = true
})

-- activate a snippet
vim.keymap.set({"i"}, "<C-f>", function() ls.expand() end, {silent = true})

-- tab and shift tab to navigate within a snippt
vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

-- Ctrl E
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/core/luasnip/'})

