module MenuBar exposing (menubar)

import Html exposing (Html, Attribute, text, nav, li, ul, a, div)
import Html.Attributes exposing (class, classList, id, attribute)
import Models exposing (AppModel)
import Messages exposing (Msg)


menubar : Html Msg
menubar =
    nav [ class "main-nav" ]
        [ div
            [ ariaHidden "true" ]
            []
        , div [] [ a [] [ text "Optiwait" ] ]
        , ul [ class "mobile-nav-list" ]
            [ li [ class "mobile-menu-item" ] [ a [] [ text "About" ] ]
            , li [ class "mobile-menu-item" ] [ a [] [ text "Signup/Login" ] ]
            ]
        ]


ariaHidden : String -> Attribute msg
ariaHidden val =
    attribute "aria-hidden" val
