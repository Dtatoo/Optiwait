module Signup.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Signup.Models exposing (Model)
import Signup.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Sign Up" ]
        , div []
            [ label [] [ text "Email Address" ]
            , input [ onInput Email ] []
            , label [] [ text "Password" ]
            , input [ onInput Password ] []
            , label [] [ text "Confirm Password" ]
            , input [] []
            ]
        , button [ onClick Signup ] [ text "Signup" ]
        , result model
        ]


result : Model -> Html Msg
result model =
    case model.success of
        Just True ->
            h1 [] [ text "User Created" ]

        Just False ->
            h1 [] [ text "User NOTTTT created" ]

        Nothing ->
            h1 [] []
