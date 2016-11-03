module GooglePlaces.Main exposing (..)

import Task
import Http
import Html exposing (..)
import Html.Events exposing (onClick)
import GooglePlaces.Model as PlacesModel
import GooglePlaces.PlacesDecoder as PlacesDecoder
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


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Google Place Test" ]
        , button [ onClick Fetch ] [ text "GET PLACE!" ]
        , descriptionsView model
        ]



--ifError : Model -> String


getDescriptions : Model -> List String
getDescriptions model =
    (.predictions >> List.map .description) model


descriptionsView : Model -> Html Msg
descriptionsView model =
    model
        |> getDescriptions
        |> List.map (\item -> div [] [ text item ])
        |> div []
