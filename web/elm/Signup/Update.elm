module Signup.Update exposing (..)

import Utils
import Signup.Models exposing (Model, UserCredentials)
import Signup.Messages exposing (Msg(..))
import Navigation
import Signup.Api as Api
import Http


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SignUpPage ->
            ( model, Navigation.newUrl ("signup") )

        Email email ->
            ({ model | email = email }) ! []

        Password password ->
            ({ model | password = password }) ! []

        Signup ->
            let
                credentials =
                    UserCredentials model.email model.password
            in
                ( model, userSignup credentials )

        NewUser (Ok message) ->
            ( model, Navigation.newUrl "#" )

        NewUser (Err error) ->
            ({ model | error = Just error }) ! []


userSignup : UserCredentials -> Cmd Msg
userSignup credentials =
    Api.createUser credentials
        |> Http.send NewUser
