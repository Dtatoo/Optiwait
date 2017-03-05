module ClinicsList.Models exposing (..)

import Table
import ClinicsList.Messages exposing (Msg)


type alias Time =
    { hour : Int
    , min : Int
    }


type alias ClinicInfo =
    { name : String
    , location : String
    , hours : ( Time, Time )
    }


type alias Model =
    { clinics : List ClinicInfo
    , tableState : Table.State
    , query : String
    }



-- Initialize Table View data


init : ( Model, Cmd Msg )
init =
    { clinics = clinicInfos
    , tableState = Table.initialSort "Name"
    , query = ""
    }
        ! []



-- TEST VALUES TODO: remove this once it is wired up with API


defaultOpenAndClosingTime : ( Time, Time )
defaultOpenAndClosingTime =
    ( Time 10 0, Time 18 0 )


clinicInfos : List ClinicInfo
clinicInfos =
    [ ClinicInfo "name1" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name2" "location" defaultOpenAndClosingTime
    , ClinicInfo "name3" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name4" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name5" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name6" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name7" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name8" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name9" "location1" defaultOpenAndClosingTime
    , ClinicInfo "name kevin" "location1" defaultOpenAndClosingTime
    ]
