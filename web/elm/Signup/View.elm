module Signup.View exposing (..)

import Html exposing (..)
import Signup.Model as M


type alias Model =
    M.Signup


view : Model -> Html a
view model =
    div []
        [ h1 [] [ text "Sign Up" ]
        , div []
            [ label [] [ text "First Name" ]
            , input [] []
            , label [] [ text "Last Name" ]
            , input [] []
            ]
        , div []
            [ label [] [ text "Email Address" ]
            , input [] []
            , label [] [ text "Password" ]
            , input [] []
            , label [] [ text "Confirm Password" ]
            , input [] []
            ]
        ]
