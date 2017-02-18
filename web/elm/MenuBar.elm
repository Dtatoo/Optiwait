module MenuBar exposing (Model, Msg, init, update, menubar)

import Html exposing (Html, Attribute, text, nav, li, ul, a, div)
import Html.Attributes exposing (class, classList, id, attribute)
import Html.Events exposing (onClick)


type Msg
    = ShowMenu


type alias Model =
    { showMenu : Bool
    }


init : ( Model, Cmd Msg )
init =
    Model False ! []


menubar : Model -> Html Msg
menubar model =
    nav [ class "main-nav" ]
        [ div [ mobileMenuClass model, onClick ShowMenu, ariaHidden "true" ] []
        , ul [ class "main-nav-list" ]
            [ li [] [ a [] [ text "Optiwait" ] ]
            , li [ class "mobile-hidden" ] [ a [] [ text "About" ] ]
            , li [ class "mobile-hidden" ] [ a [] [ text "Signup/Login" ] ]
            ]
        ]


ariaHidden : String -> Attribute msg
ariaHidden val =
    attribute "aria-hidden" val


mobileMenuClass : Model -> Attribute msg
mobileMenuClass { showMenu } =
    classList
        [ ( "show-mobile-menu", showMenu )
        , ( "mobile-menu", True )
        , ( "fa fa-bars", True )
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShowMenu ->
            { model | showMenu = not model.showMenu } ! []
