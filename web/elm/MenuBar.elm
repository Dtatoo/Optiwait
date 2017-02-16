module MenuBar exposing (menubar)

import Models exposing (AppModel)
import Messages exposing (Msg)
import Html exposing (Html, Attribute, text, nav, li, ul, a, div, span)
import Html.Attributes exposing (class, id, attribute)


menubar : AppModel -> Html Msg
menubar model =
    nav [ class "main-nav" ]
        [ ul [ class "main-nav-list" ]
            [ li [] [ a [ class "fa fa-bars", ariaHidden "true" ] [] ]
            , li [] [ a [] [ text "Home" ] ]
            , li [] [ a [] [ text "About" ] ]
            , li [] [ a [] [ text "Signup/Login" ] ]
            ]
        ]


ariaHidden : String -> Attribute msg
ariaHidden val =
    attribute "aria-hidden" val
