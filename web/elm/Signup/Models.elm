module Signup.Models exposing (..)

import Signup.Messages exposing (Msg)


type alias Model =
    { email : String
    , password : String
    , success : Maybe Bool
    }


type alias UserCredentials =
    { email : String
    , password : String
    }


type alias Signup =
    { user : UserCredentials
    }


init : ( Model, Cmd Msg )
init =
    (Model "" "" Nothing) ! []
