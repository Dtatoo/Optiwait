module Utils exposing (..)

import Http exposing (Error(..))


httpErrorHandler : Error -> String
httpErrorHandler error =
    case error of
        BadUrl _ ->
            "notFound"

        Timeout ->
            "timeout"

        NetworkError ->
            "networkerror"

        BadStatus statusError ->
            let
                status =
                    statusError.status
            in
                status.code
                    |> toString
                    |> String.append (": " ++ status.message)

        BadPayload _ _ ->
            "json parse errer"
