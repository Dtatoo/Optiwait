module Models exposing (..)

import Navigation
import UrlParser exposing (parseHash)
import Routing exposing (Route, route)
import ClinicsList.Model exposing (ClinicsTable, init)
import Messages exposing (Msg(..))
import Login.Main as Login
import Signup.Main as Signup
import AddClinic.Main as AddClinic


type alias AppModel =
    { currentPage : Maybe Route
    , history : List (Maybe Route)
    , clinicsTable : ClinicsTable
    , loginPage : Login.Model
    , signupPage : Signup.Model
    , addClinicPage : AddClinic.Model
    }


init : Navigation.Location -> ClinicsTable -> AppModel
init location clinicsTable =
    let
        currentRouter =
            parseHash route location
    in
        { clinicsTable = clinicsTable
        , history = [ currentRouter ]
        , currentPage = currentRouter
        , loginPage = Login.init
        , signupPage = Signup.init
        , addClinicPage = AddClinic.init
        }
