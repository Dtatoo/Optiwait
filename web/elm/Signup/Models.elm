module Signup.Models exposing (..)

import Signup.Messages exposing (Msg)


type alias Model =
    { email : String
    , password : String
    }


init : ( Model, Cmd Msg )
init =
    (Model "" "") ! []
