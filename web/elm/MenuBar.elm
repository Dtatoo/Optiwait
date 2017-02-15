module MenuBar exposing (menubar)

import Models exposing (AppModel)
import Messages exposing (Msg)
import Html exposing (Html, text, nav, li, ul, a, div, span)
import Html.Attributes exposing (class, id)


menubar : AppModel -> Html Msg
menubar model =
    nav [ class "main-nav", id "main-nav" ]
        [ ul [ id "main-nav-list" ]
            [ li [] [ a [] [ text "Home" ] ]
            , li [] [ a [] [ text "About" ] ]
            , li [] [ a [] [ text "Signup/Login" ] ]
            ]
        ]
