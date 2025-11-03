require('tabout').setup{
  lazy = true,
  tabkey = '<Tab>',
  backwards_tabkey = '<S-Tab>',
  act_as_tab = true,

  enable_backwards = true,
  completion = true,

  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = '`', close = '`' },
    { open = '(', close = ')' },
    { open = '[', close = ']' },
    { open = '{', close = '}' },
    { open = '$', close = '$' },
    { open = "`", close = "'" }
  },

  ignore_beginning = false,

}

