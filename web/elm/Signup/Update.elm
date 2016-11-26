module Signup.Update exposing (..)

import Signup.Models exposing (Model)
import Signup.Messages exposing (Msg(..))
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SignUpPage ->
            ( model, Navigation.newUrl ("signup") )
