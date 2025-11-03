local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {

	snippet = { -- allows completion engine to expand snippets from luasnip syntax
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

    mapping = cmp.mapping.preset.insert {

      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      -- C-CR will always expand a completion, even without selection
      ['<C-CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },

      -- CR will expand a selected completion
      ['<CR>'] = cmp.mapping(function (fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         else
           fallback()
        end
      end),

      -- tab will expand a selected completion if there is one
      -- else, it will jump forward in a snippet
      -- else, it will fallback

      ['<Tab>'] = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         elseif luasnip.locally_jumpable() then
           luasnip.jump(1)
         else
           fallback()
        end
      end,

      -- shift tab will jump back through a snippet
      -- else, will fallback

      ['<S-Tab>'] = function(fallback)
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
       else
          fallback()
        end
      end,

      -- C-j navigates down in cmp menu

      ['<C-j>'] = cmp.mapping(function (fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end),

      -- C-k navigates up in cmp menu

      ['<C-k>'] = cmp.mapping(function (fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end),

    },

    sources = cmp.config.sources {
      { name = 'nvim_lsp' }, -- lsp suggestions. this is the big one
      { name = 'luasnip' }, -- luasnip snippet suggestions
      { name = 'buffer' }, -- suggestions based on content in the active buffer. comment this out to remove plaintext suggestions
      { name = 'path' }, -- suggestions when typing paths
    },
}
