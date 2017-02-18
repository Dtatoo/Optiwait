module MenuBar exposing (menubar)

import Models exposing (AppModel)
import Messages exposing (Msg)
import Html exposing (Html, Attribute, text, nav, li, ul, a, div, span)
import Html.Attributes exposing (class, id, attribute)


menubar : AppModel -> Html Msg
menubar model =
    nav [ class "main-nav" ]
        [ div [ class "mobile-menu fa fa-bars", ariaHidden "true" ] []
        , ul [ class "main-nav-list" ]
            [ li [] [ a [] [ text "Optiwait" ] ]
            , li [ class "mobile-hidden" ] [ a [] [ text "About" ] ]
            , li [ class "mobile-hidden" ] [ a [] [ text "Signup/Login" ] ]
            ]
        ]


ariaHidden : String -> Attribute msg
ariaHidden val =
    attribute "aria-hidden" val
