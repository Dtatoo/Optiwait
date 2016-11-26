module Update exposing (..)

import UrlParser exposing (parseHash)
import Navigation exposing (newUrl)
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (route)
import ClinicsList.Update as ClinicsList
import Login.Main as Login
import Signup.Update as Signup
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
                ( newModel, cmd ) =
                    ClinicsList.update subMsg model.clinicsList
            in
                ( { model | clinicsList = newModel }
                , Cmd.map ClinicsListMsg cmd
                )

        LoginMsg subMsg ->
            let
                ( newModel, cmd ) =
                    Login.update subMsg model.login
            in
                ( { model | login = newModel }, Cmd.map LoginMsg cmd )

        SignupMsg subMsg ->
            let
                ( newModel, cmd ) =
                    Signup.update subMsg model.signup
            in
                ( { model | signup = newModel }, Cmd.map SignupMsg cmd )

        AddClinicMsg subMsg ->
            let
                ( newModel, cmd ) =
                    AddClinic.update subMsg model.addClinic
            in
                ( { model | addClinic = newModel }, Cmd.map AddClinicMsg cmd )
