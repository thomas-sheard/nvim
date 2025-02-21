require('tabout').setup{
  lazy = false,
  tabkey = '<Tab>',
  backwards_tabkey = '<S-Tab>',
  act_as_tab = true,

  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = '`', close = '`' },
    { open = '(', close = ')' },
    { open = '[', close = ']' },
    { open = '{', close = '}' }
  },

  ignore_beginning = true,

}

