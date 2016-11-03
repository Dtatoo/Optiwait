module ClinicsList.Model exposing (..)

import Table


type alias Time =
    { hour : Int
    , min : Int
    }


type alias ClinicInfo =
    { name : String
    , location : String
    , hours : ( Time, Time )
    }


type alias ClinicsTable =
    { clinics : List ClinicInfo
    , tableState : Table.State
    , query : String
    }



-- Initialize Table View datat


init : List ClinicInfo -> ClinicsTable
init clinics =
    { clinics = clinics
    , tableState = Table.initialSort "Name"
    , query = ""
    }
