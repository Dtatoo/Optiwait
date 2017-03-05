module AddClinic.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id)
import Navigation exposing (newUrl)
import AddClinic.Models exposing (Model)
import AddClinic.Messages exposing (Msg(..))
import AddClinic.AddressForm exposing (initPlacesSearch, placeSuggestion)


subscriptions : Model -> Sub Msg
subscriptions model =
    placeSuggestion Result


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddClinicPage ->
            ( model, newUrl ("clinic") )

        Result placeName ->
            ( { model | name = placeName }, Cmd.none )


view : Model -> Html Msg
view { name } =
    div []
        [ div [ id "placesearch" ] [ text "Something should be here...." ]
        , div [] [ text name ]
        ]
