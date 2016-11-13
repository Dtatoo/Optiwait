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
    = Fetch
    | FetchSuccess Model
    | FetchFail Http.Error
    | SignUpPage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, getPlacesData hardCodedQuery )

        FetchSuccess googlePlaces ->
            ( googlePlaces, Cmd.none )

        FetchFail _ ->
            ( model, Cmd.none )

        SignUpPage ->
            ( model, Navigation.newUrl ("signup") )


hardCodedQuery : List ( String, String )
hardCodedQuery =
    [ ( "location", "52.133333,-106.683333" )
      -- Saskatoon
    , ( "input", "UofS" )
    , ( "key", "AIzaSyBLh2_PpmwPEybHZp4whBMxsVDiwfvfntg" )
    ]


getPlacesData : List ( String, String ) -> Cmd Msg
getPlacesData query =
    let
        getUrl =
            "https://maps.googleapis.com/maps/api/place/autocomplete/json"

        urlWithQuery =
            Http.url getUrl hardCodedQuery
    in
        Task.perform
            FetchFail
            FetchSuccess
        <|
            Http.get PlacesDecoder.decodeGooglePlaces urlWithQuery


signupModel : PlacesModel.Signup
signupModel =
    PlacesModel.Signup "" ""


view : Html Msg
view =
    SignupView.view signupModel
