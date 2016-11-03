module TestClinics exposing (..)

import ClinicsList.Model exposing (..)


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
    , ClinicInfo "name10" "location1" defaultOpenAndClosingTime
    ]
