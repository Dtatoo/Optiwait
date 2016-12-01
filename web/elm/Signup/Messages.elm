module Signup.Messages exposing (Msg(..))

import Http


type Msg
    = SignUpPage
    | Signup
    | NewUser (Result Http.Error String)
    | Email String
    | Password String
