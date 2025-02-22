require("nvim-autopairs").setup({
  event = "InsertEnter",
  config = true,
--  check_ts = false,
})

-- enables autopairs after a function completion

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

