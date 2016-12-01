module Signup.UserJson exposing (encodeSignup)

import Signup.Models exposing (UserCredentials, Signup)


-- User only needs to enter username and password to sign up
-- Required to encode to following datatype
{--
    {
        "user":{
            "email": "email@email.com",
            "password": "mypassword",
        }
    }
--}

import Json.Encode
import Json.Decode
import Json.Decode.Pipeline as Pipeline


encodeSignup : UserCredentials -> Json.Encode.Value
encodeSignup credentials =
    Signup credentials
        |> encodeUser


encodeUser : Signup -> Json.Encode.Value
encodeUser record =
    Json.Encode.object
        [ ( "user", encodeCredentials <| record.user )
        ]


encodeCredentials : UserCredentials -> Json.Encode.Value
encodeCredentials record =
    Json.Encode.object
        [ ( "email", Json.Encode.string <| record.email )
        , ( "password", Json.Encode.string <| record.password )
        ]



{--
type alias Error =
    { errors : ErrorMessage
    }


type alias EmailErrors =
    { emailErrors : List String
    }


decodeErrorMessage : Json.Decode.Decoder Error
decodeErrorMessage =
    Json.Decode.Pipeline.decode Error
        |> Json.Decode.Pipeline.required "errors" (decodeErrorMessageErrors)


decodeMailErrors : Json.Decode.Decoder (Maybe EmailErrors)
decodeMailErrors =
    Json.Decode.Pipeline.decode EmailErrors
        |> Json.Decode.Pipeline.required "email" (Json.Decode.nullable Json.Decode.list Json.Decode.string)


encodeErrorMessage : ErrorMessage -> Json.Encode.Value
encodeErrorMessage record =
    Json.Encode.object
        [ ( "errors", encodeErrorMessageErrors <| record.errors )
        ]


encodeErrorMessageErrors : ErrorMessageErrors -> Json.Encode.Value
encodeErrorMessageErrors record =
    Json.Encode.object
        [ ( "email", Json.Encode.list <| List.map Json.Encode.string <| record.email )
        ]
-}
