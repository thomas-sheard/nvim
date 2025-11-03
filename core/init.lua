vim.g.mapleader = " "

require("core.keymaps")
require("core.options")

require("core.lazy")

require("core.treesitter")
require("core.lsp")
require("core.oil")
require("core.telescope")

require("core.cmp")
require("core.luasnip")

require("core.autopairs")
require("core.tabout")


--require("core/telescope")

--[[

set keybinds to homogenised tab completion for both luasnip and cmp

install autopairs and config

install tabout and config

get both of them working how i want

document / rewrite parts of website to make this fit (or talk about the process of realising)

other plugins:

oil
telescope (learn this one!!)

cursorline ? maybe doesn't need documenting though lol

--]]

