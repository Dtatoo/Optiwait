module Models exposing (..)

import ClinicsList.Model exposing (ClinicsTable, init)
import Login.Main as Login
import GooglePlaces.Main as GooglePlaces
import Routing


type alias AppModel =
    { clinicsTable : ClinicsTable
    , loginPage : Login.Model
    , signupPage : GooglePlaces.Model
    , route : Routing.Route
    }


init : Routing.Route -> ClinicsTable -> AppModel
init route clinicsTable =
    { clinicsTable = clinicsTable
    , loginPage = Login.model
    , signupPage = GooglePlaces.init
    , route = route
    }
