module AddClinic.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import Navigation


--port searchQuery : (String -> msg) -> Sub msg


type alias Model =
    { query : String
    , name : String
    , placeId : String
    }


init : Model
init =
    Model "" "" ""


type Msg
    = AddClinicPage
    | Query String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddClinicPage ->
            ( model, Navigation.newUrl ("addclinic") )

        Query searchTerm ->
            ( { model | query = searchTerm }, Cmd.none )


view : Html Msg
view =
    div []
        [ input [ id "search-box" ] [] ]
