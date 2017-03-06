module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html as App
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (Route(..))
import ClinicsList.View as ClinicsList
import Login.Main as Login
import Signup.View as Signup
import AddClinic.Main as AddClinic
import MenuBar exposing (menubar)


view : AppModel -> Html Msg
view model =
    div []
        [ homePageView
        , page model
        ]


page : AppModel -> Html Msg
page model =
    case model.currentPage of
        HomeRoute ->
            App.map ClinicsListMsg (ClinicsList.view model.clinicsList)

        LoginRoute ->
            App.map LoginMsg (Login.view model.login)

        SignupRoute ->
            App.map SignupMsg (Signup.view model.signup)

        AddClinicRoute ->
            App.map AddClinicMsg (AddClinic.view model.addClinic)

        _ ->
            text "ERROR PAGE"


homePageView : Html Msg
homePageView =
    div []
        [ menubar
        ]
