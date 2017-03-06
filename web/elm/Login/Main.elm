module Login.Main exposing (..)

import Html exposing (Html, span, h2, div, form, input, button, label, text)
import Html.Attributes exposing (class, type_, placeholder, name)
import Html.Events exposing (onInput)
import Navigation


type alias Model =
    { email : String
    , password : String
    }


type alias LoginInput =
    { event : Html.Attribute Msg
    , inputType : String
    , inputName : String
    , placeHolder : String
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
        [ h2 [ class "lr-padding" ] [ text "Login" ]
        , inputFields
        ]


inputFields : Html Msg
inputFields =
    let
        emailField =
            loginFields
                (LoginInput
                    (onInput Email)
                    "text"
                    "email"
                    "Email"
                )

        passwordField =
            loginFields
                (LoginInput
                    (onInput Password)
                    "password"
                    "password"
                    "Password"
                )
    in
        form []
            [ inputWithSpan emailField "Email"
            , inputWithSpan passwordField "Password"
            , div [ class "padding flex flex-center bg-grey margin" ]
                [ button [] [ span [] [ text "Login" ] ] ]
            ]


type alias LabelText =
    String


inputWithSpan : Html Msg -> LabelText -> Html Msg
inputWithSpan inputElement labelText =
    span [ class "flex flex-center padding-05" ]
        [ inputElement
        ]


loginFields : LoginInput -> Html Msg
loginFields { event, inputType, inputName, placeHolder } =
    input
        [ type_ inputType
        , class "padding"
        , name inputName
        , placeholder placeHolder
        , event
        ]
        []
