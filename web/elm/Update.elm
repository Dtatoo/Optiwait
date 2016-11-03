module Update exposing (..)

import Models exposing (AppModel)
import Messages exposing (Msg(..))
import ClinicsList.Update
import Login.Main as Login
import GooglePlaces.Main as GooglePlaces


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        ClinicsListMsg subMsg ->
            let
                ( newList, cmd ) =
                    ClinicsList.Update.update subMsg model.clinicsTable
            in
                ( { model | clinicsTable = newList }
                , Cmd.map ClinicsListMsg cmd
                )

        LoginMsg subMsg ->
            let
                ( newModel, cmd ) =
                    Login.update subMsg model.loginPage
            in
                ( { model | loginPage = newModel }, Cmd.map LoginMsg cmd )

        SignupMsg subMsg ->
            let
                ( newModel, cmd ) =
                    GooglePlaces.update subMsg model.signupPage
            in
                ( { model | signupPage = newModel }, Cmd.map SignupMsg cmd )
