port module AddClinic.AddressForm exposing (..)


port initPlacesSearch : Maybe String -> Cmd msg


port placeSuggestion : (String -> msg) -> Sub msg
