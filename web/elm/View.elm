module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (Route(..))
import ClinicsList.Model exposing (ClinicsTable)
import ClinicsList.View
import Login.Main as Login
import GooglePlaces.Main as Signup


view : AppModel -> Html Msg
view model =
    div []
        [ page model ]


page : AppModel -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            homePageView model

        LoginRoute ->
            Html.App.map LoginMsg (Login.view model.loginPage)

        SignupRoute ->
            Html.App.map SignupMsg (Signup.view model.signupPage)

        _ ->
            text "ERROR PAGE"


clinicsTable : ClinicsTable -> Html Msg
clinicsTable model =
    Html.App.map ClinicsListMsg (ClinicsList.View.view model)


homePageView : AppModel -> Html Msg
homePageView model =
    div []
        [ img [ src "/images/optiwait_dark.png", alt "Optiwait logo" ] []
        , clinicsTable model.clinicsTable
        ]
