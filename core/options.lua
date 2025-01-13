-- system

vim.opt.timeoutlen = 300 -- delay for key chord inputs (eg. after leader is pressed)

-- saving / edit history

vim.opt.undofile = true -- whether nvim should save an undotree file
vim.opt.updatetime = 250 -- time (ms) without an edit for a swap file to be written

-- navigation

vim.opt.mouse = '' -- disable mouse ("learn thy motions!")
vim.opt.scrolloff = 8 -- forces 8 row buffer between cursor and screen bounds
vim.opt.mousescroll = 'ver:10' -- increase scroll event sensitivity

-- line numbers

vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers (i like both)

vim.opt.numberwidth = 2 -- 2 char width
vim.opt.signcolumn = "yes" -- adds padding to line numbers
vim.opt.statuscolumn = '%{v:relnum?v:relnum:v:lnum}' -- left aligns line numbers

vim.opt.cursorline = true -- highlights current line
vim.opt.cursorlineopt = 'number' -- only highlights number, not line

-- indenting

vim.opt.tabstop = 4 -- tab = 4 spaces (when writing a file)
vim.opt.softtabstop = 4 -- tab = 4 spaces (when performing editor commands)
vim.opt.shiftwidth = 2 -- width in spaces of shifting (<<, >>)
vim.opt.expandtab = true -- converts tabs to spaces

vim.opt.autoindent = true -- auto indent lines following an indented line
vim.opt.smartindent = true -- makes autodindent smarter (idk how lol) a very very long msg

-- line wrapping

vim.opt.wrap = true -- allows line wrapping
vim.opt.linebreak = true -- only breaks a line on a word boundary
vim.opt.showbreak = "" -- text inserted before broken lines

vim.opt.breakindent = true -- indented multi-lines retain indenting on broken text

-- searching

vim.opt.hlsearch = true -- highlight on search
vim.opt.incsearch = true -- live search highlighting updates

vim.opt.ignorecase = true -- case-insensitive searching (override with \C)
vim.opt.smartcase = true -- also override with capitalised query

-- completion

vim.opt.completeopt = 'menuone,noselect' -- will show completion menu if there is at least one completion option, and will not select an option by default

-- spell check

vim.opt.spelllang = 'en_au' -- australian spelling (en_au, en_gb, en_us)
vim.opt.spell = false -- no spellcheck by default (use ':set spell' and ':set nospell' to toggle on the fly)

-- aesthetics 

vim.opt.guicursor = "r-c-v-sm:block,i-ci-ve:ver25,n-cr-o:hor10"
vim.opt.conceallevel = 2 -- level of syntax replacement, for example math symbol macros being replaced with the actual symbol unicode in a .tex file

-- vimtex

vim.g.vimtex_view_method = 'zathura' -- set default vimtex pdf viewer
vim.g.vitex_quickfix_open_on_warning = 0
vim.g.vimtex_view_forward_search_on_start = false
