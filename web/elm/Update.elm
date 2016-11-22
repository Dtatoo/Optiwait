module Update exposing (..)

import UrlParser exposing (parseHash)
import Navigation exposing (newUrl)
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (route)
import ClinicsList.Update
import Login.Main as Login
import Signup.Main as Signup
import AddClinic.Main as AddClinic


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        NewUrl url ->
            ( model, newUrl url )

        UrlChange location ->
            ( { model
                | history = parseHash route location :: model.history
                , currentPage = parseHash route location
              }
            , Cmd.none
            )

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
                    Signup.update subMsg model.signupPage
            in
                ( { model | signupPage = newModel }, Cmd.map SignupMsg cmd )

        AddClinicMsg subMsg ->
            let
                ( newModel, cmd ) =
                    AddClinic.update subMsg model.addClinicPage
            in
                ( { model | addClinicPage = newModel }, Cmd.map AddClinicMsg cmd )
