module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html as App
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (Route(..))
import ClinicsList.View as ClinicsList
import Login.Main as Login
import Signup.View as Signup
import AddClinic.Main as AddClinic


view : AppModel -> Html Msg
view model =
    div []
        [ homePageView
        , page model
        ]


page : AppModel -> Html Msg
page model =
    case model.currentPage of
        Just HomeRoute ->
            App.map ClinicsListMsg (ClinicsList.view model.clinicsList)

        Just LoginRoute ->
            App.map LoginMsg (Login.view model.login)

        Just SignupRoute ->
            App.map SignupMsg (Signup.view model.signup)

        Just AddClinicRoute ->
            App.map AddClinicMsg (AddClinic.view model.addClinic)

        _ ->
            text "ERROR PAGE"


homePageView : Html Msg
homePageView =
    div []
        [ img [ src "/images/optiwait_dark.png", alt "Optiwait logo" ] []
        ]
