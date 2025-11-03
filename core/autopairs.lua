local rule = require('nvim-autopairs.rule')
local autopairs = require('nvim-autopairs')

autopairs.setup({
  event = "InsertEnter",
  config = true,
--  check_ts = false,
  ignored_next_char = [=[[%w%%%'%[%"%.%`]]=],
})

autopairs.add_rules({
  rule("$", "$", {"tex", "latex"})
  :with_move(function(opts)
         return opts.next_char == opts.char
      end),
  rule("`", "'", {"tex", "latex"}),
})

-- enables autopairs after a function completion

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
