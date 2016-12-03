module Signup.View exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Navigation
import Utils
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
        , error model
        ]


error : Model -> Html Msg
error model =
    case model.error of
        Just errorMessages ->
            h1 [] [ text (Utils.httpErrorHandler errorMessages) ]

        Nothing ->
            h1 [] []
