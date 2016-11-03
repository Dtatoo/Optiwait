module Main exposing (..)

--import Html.App as App

import ClinicsList.Model exposing (ClinicInfo, ClinicsTable)
import Models exposing (AppModel)
import View exposing (view)
import Update exposing (update)
import Messages exposing (Msg(..))
import Navigation
import Routing exposing (Route)


{--Test Values --}

import TestClinics exposing (clinicInfos)


init : Result String Route -> ( AppModel, Cmd Msg )
init result =
    let
        currentRoute =
            Routing.routeFromResult result

        clinicInit =
            ClinicsList.Model.init clinicInfos
    in
        ( Models.init currentRoute clinicInit, Cmd.none )


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


urlUpdate : Result String Route -> AppModel -> ( AppModel, Cmd Msg )
urlUpdate result model =
    let
        currentRoute =
            Routing.routeFromResult result
    in
        ( { model | route = currentRoute }, Cmd.none )


main : Program Never
main =
    Navigation.program Routing.parser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }
