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


menuBar : Html Msg
menuBar =
    div [ class "nav" ]
        [ ul []
            [ li [ class "home" ] [ a [] [ text "Home" ] ]
            , li [ class "about" ] [ a [] [ text "About" ] ]
            , li [ class "Login" ] [ a [] [ text "Login" ] ]
            ]
        ]


menuBar2 : Html Msg
menuBar2 =
    nav [ class "nav" ]
        [ div [ class "container" ]
            [ div [ class "nav-left" ]
                [ a [ class "nav-item" ]
                    [ img [ src "/images/phoenix.png" ] [] ]
                , a [ class "nav-item is-tab is-active" ] [ text "Home" ]
                , a [ class "nav-item is-tab" ] [ text "About" ]
                , a [ class "nav-item is-tab" ] [ text "Login" ]
                ]
            ]
        ]


homePageView : Html Msg
homePageView =
    div []
        [ menuBar2
        ]
