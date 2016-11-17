module Signup.Main exposing (..)

import Task
import Http
import Html exposing (..)
import Html.Events exposing (onClick)
import Signup.Model as PlacesModel
import Signup.View as SignupView
import Signup.PlacesDecoder as PlacesDecoder
import Navigation


type alias Model =
    PlacesModel.GooglePlaces


init : Model
init =
    PlacesModel.init


type Msg
    = SignUpPage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SignUpPage ->
            ( model, Navigation.newUrl ("signup") )


signupModel : PlacesModel.Signup
signupModel =
    PlacesModel.Signup "" ""


view : Html Msg
view =
    SignupView.view signupModel
