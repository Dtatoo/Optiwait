module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html as App
import Models exposing (AppModel)
import Messages exposing (Msg(..))
import Routing exposing (Route(..))
import ClinicsList.Model exposing (ClinicsTable)
import ClinicsList.View
import Login.Main as Login
import Signup.Main as Signup


view : AppModel -> Html Msg
view model =
    div []
        [ page model ]


page : AppModel -> Html Msg
page model =
    case model.currentPage of
        Just HomeRoute ->
            homePageView model

        Just LoginRoute ->
            App.map LoginMsg (Login.view model.loginPage)

        Just SignupRoute ->
            App.map SignupMsg (Signup.view)

        _ ->
            text "ERROR PAGE"


clinicsTable : ClinicsTable -> Html Msg
clinicsTable model =
    App.map ClinicsListMsg (ClinicsList.View.view model)


homePageView : AppModel -> Html Msg
homePageView model =
    div []
        [ img [ src "/images/optiwait_dark.png", alt "Optiwait logo" ] []
        , clinicsTable model.clinicsTable
        ]
