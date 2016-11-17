module Main exposing (..)

import ClinicsList.Model exposing (ClinicInfo, ClinicsTable)
import Models exposing (AppModel)
import View exposing (view)
import Update exposing (update)
import Messages exposing (Msg(..))
import Navigation
import Routing exposing (Route)


{--Test Values --}

import TestClinics exposing (clinicInfos)


init : Navigation.Location -> ( AppModel, Cmd Msg )
init location =
    let
        clinicsInit =
            -- clinicInfos being imported as a test
            ClinicsList.Model.init clinicInfos
    in
        ( Models.init location clinicsInit, Cmd.none )


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never AppModel Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
