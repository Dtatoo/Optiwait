module AddClinic.Models exposing (..)

import AddClinic.Messages exposing (Msg)
import AddClinic.AddressForm exposing (initPlacesSearch)


type alias Model =
    { placeId : String
    , name : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" "", initPlacesSearch Nothing )
