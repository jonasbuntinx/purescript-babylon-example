{ name = "purescript-babylon-example"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "console"
  , "effect"
  , "either"
  , "exceptions"
  , "maybe"
  , "nullable"
  , "numbers"
  , "prelude"
  , "web-dom"
  , "web-events"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
