module Main exposing (..)

import Models exposing (AppModel, init)
import View exposing (view)
import Update exposing (update)
import Messages exposing (Msg(..))
import Navigation exposing (program)
import AddClinic.Main as AddClinic


-- Subscriptions


subscriptions : AppModel -> Sub Msg
subscriptions { addClinic } =
    Sub.batch
        [ Sub.map AddClinicMsg (AddClinic.subscriptions addClinic) ]


main : Program Never AppModel Msg
main =
    program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
