module Models exposing (..)

import ClinicsList.Model exposing (ClinicsTable, init)
import Login.Main as Login
import Signup.Main as Signup
import Routing


type alias AppModel =
    { clinicsTable : ClinicsTable
    , loginPage : Login.Model
    , signupPage : Signup.Model
    , route : Routing.Route
    }


init : Routing.Route -> ClinicsTable -> AppModel
init route clinicsTable =
    { clinicsTable = clinicsTable
    , loginPage = Login.model
    , signupPage = Signup.init
    , route = route
    }
