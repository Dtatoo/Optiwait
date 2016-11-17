module Routing exposing (..)

import UrlParser exposing (Parser, s, top, oneOf, map)


-- URL PRASE


type Route
    = HomeRoute
    | LoginRoute
    | SignupRoute
    | NotFoundRoute


route : Parser (Route -> a) a
route =
    oneOf
        [ map HomeRoute top
        , map LoginRoute (s "login")
        , map SignupRoute (s "signup")
        ]
