module Signup.PlacesDecoder exposing (..)

import Json.Decode
    exposing
        ( Decoder
        , list
        , string
        , int
        , decodeString
        )
import Json.Decode.Pipeline as Json
import Signup.Model
    exposing
        ( GooglePlaces
        , ComplexType
        , MatchedSubstrings
        , Terms
        )


parse : String -> Result String GooglePlaces
parse json =
    decodeString decodeGooglePlaces json


decodeGooglePlaces : Decoder GooglePlaces
decodeGooglePlaces =
    Json.decode GooglePlaces
        |> Json.required "status" (string)
        |> Json.required "predictions" (list decodeComplexType)


decodeComplexType : Decoder ComplexType
decodeComplexType =
    Json.decode ComplexType
        |> Json.required "description" string
        |> Json.required "id" string
        |> Json.required "matched_substrings" (list decodeMatchedSubstrings)
        |> Json.required "place_id" string
        |> Json.required "reference" string
        |> Json.required "terms" (list decodeTerms)
        |> Json.required "types" (list string)


decodeMatchedSubstrings : Decoder MatchedSubstrings
decodeMatchedSubstrings =
    Json.decode MatchedSubstrings
        |> Json.required "length" int
        |> Json.required "offset" int


decodeTerms : Decoder Terms
decodeTerms =
    Json.decode Terms
        |> Json.required "offset" int
        |> Json.required "value" string
