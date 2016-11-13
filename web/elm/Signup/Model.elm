module Signup.Model exposing (..)


type alias Signup =
    { email : String
    , password : String
    }


type alias GooglePlaces =
    { status : String
    , predictions : List ComplexType
    }


type alias ComplexType =
    { description : String
    , id : String
    , matchedSubstrings : List MatchedSubstrings
    , place_id : String
    , reference : String
    , terms : List Terms
    , types : List String
    }


type alias MatchedSubstrings =
    { length : Int
    , offset : Int
    }


type alias Terms =
    { offset : Int
    , value : String
    }


init : GooglePlaces
init =
    GooglePlaces "" [ initComplexType ]


initTerms : Terms
initTerms =
    Terms 0 ""


initMatchedSubstrings : MatchedSubstrings
initMatchedSubstrings =
    MatchedSubstrings 0 0


initComplexType : ComplexType
initComplexType =
    ComplexType "" "" [ initMatchedSubstrings ] "" "" [ initTerms ] [ "" ]
