local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
--local f = ls.function_node
--local c = ls.choice_node
--local d = ls.dynamic_node
--local r = ls.restore_node
--local ms = ls.multi_snippet

--local events = require("luasnip.util.events")
--local ai = require("luasnip.nodes.absolute_indexer")

--local extras = require("luasnip.extras")
--local l = extras.lambda
--local rep = extras.rep
--local p = extras.partial
--local m = extras.match
--local n = extras.nonempty
--local dl = extras.dynamic_lambda

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

--local conds = require("luasnip.extras.expand_conditions")
--local postfix = require("luasnip.extras.postfix").postfix
--local types = require("luasnip.util.types")
--local parse = require("luasnip.util.parser").parse_snippet

local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {

  s("hi", t("Hello world!")),

  as("\"", fmta(
  [[
  "<>"<>
  ]], {
    i(1), i(0)
  })),

  as("(", fmta(
  [[
  (<>)<>
  ]], {
    i(1), i(0)
  })),

  as("{", fmta(
  [[
  {<>}<>
  ]], {
    i(1), i(0)
  })),

  as("[", fmta(
  [[
  [<>]<>
  ]], {
    i(1), i(0)
  })),

  as("<", fmt(
  [[
  <{}>{}
  ]], {
    i(1), i(0)
  })),

}

