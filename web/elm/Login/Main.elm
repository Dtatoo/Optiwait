module Login.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type_, placeholder)
import Html.Events exposing (onInput)
import Navigation


type alias Model =
    { email : String
    , password : String
    }


init : ( Model, Cmd Msg )
init =
    (Model "" "") ! []


type Msg
    = LoginPage
    | Email String
    | Password String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Email email ->
            ( { model | email = email }, Cmd.none )

        Password password ->
            ( { model | password = password }, Cmd.none )

        LoginPage ->
            ( model, Navigation.newUrl ("login") )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "LoginPage" ]
        , input [ type_ "text", placeholder "email", onInput Email ] []
        , input [ type_ "password", placeholder "password", onInput Password ] []
        , button [] [ text "Login" ]
        ]
