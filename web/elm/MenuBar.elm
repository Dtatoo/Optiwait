module MenuBar exposing (menubar)

import Html exposing (Html, Attribute, text, nav, li, ul, a, div)
import Html.Attributes exposing (id, class, classList, id, href, attribute)
import Messages exposing (Msg)


type alias Href =
    String


type alias Text =
    String


menubar : Html Msg
menubar =
    nav [ id "main-nav", class "padding-15" ]
        [ div [] [ a [ href "/#" ] [ text "Optiwait" ] ]
        , ul [ id "mobile-nav-list" ]
            [ listItem "" "About"
            , listItem "/#/login" "Login"
            ]
        ]


listItem : Href -> Text -> Html msg
listItem hrefLink content =
    li [ class "padding-05" ] [ a [ href hrefLink ] [ text content ] ]
