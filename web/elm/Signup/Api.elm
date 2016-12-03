module Signup.Api exposing (..)

import Http exposing (Body, Request, Response, Error(..), post, jsonBody)
import Json.Decode as Decode
import Navigation exposing (modifyUrl)
import Signup.Models exposing (UserCredentials)
import Signup.UserJson exposing (encodeSignup)


-- Test message import

import Html exposing (..)
import Signup.Messages exposing (Msg(..))


-- TODO: replace temporary server values into actual http request


requestPath : String -> String
requestPath path =
    String.append "http://localhost:4000/api/v1" path



-- post request


createUserPath : String
createUserPath =
    requestPath "/users"


encodeUserCredentials : UserCredentials -> Body
encodeUserCredentials credentials =
    encodeSignup credentials
        |> jsonBody


createUser : UserCredentials -> Request String
createUser credentials =
    let
        newUserCredentials =
            encodeUserCredentials credentials
    in
        post createUserPath newUserCredentials Decode.string
