local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {

	snippet = { -- allows completion engine to expand snippets from luasnip syntax
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

    mapping = cmp.mapping.preset.insert {

      -- tab completes selected suggestion
      ['<Tab>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },

      -- traverses next item if menu is open, activates snippet traversal, or indents
      ['<C-j>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),

      -- the same as above but traverses backwards
      ['<C-k>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },

    sources = cmp.config.sources {
      { name = 'nvim_lsp' }, -- lsp suggestions. this is the big one
      { name = 'luasnip' }, -- luasnip snippet suggestions
      { name = 'buffer' }, -- suggestions based on content in the active buffer. comment this out to remove plaintext suggestions
      { name = 'path' }, -- suggestions when typing paths
    },
}
