module Signup.Models exposing (..)

import Http
import Signup.Messages exposing (Msg)


type alias Model =
    { email : String
    , password : String
    , error : Maybe Http.Error
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
