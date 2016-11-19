module Models exposing (..)

import Navigation
import UrlParser exposing (parseHash)
import ClinicsList.Model exposing (ClinicsTable, init)
import Messages exposing (Msg(..))
import Login.Main as Login
import Signup.Main as Signup
import Routing exposing (Route, route)


type alias AppModel =
    { currentPage : Maybe Route
    , history : List (Maybe Route)
    , clinicsTable : ClinicsTable
    , loginPage : Login.Model
    , signupPage : Signup.Model
    }


init : Navigation.Location -> ClinicsTable -> AppModel
init location clinicsTable =
    let
        currentRouter =
            parseHash route location
    in
        { clinicsTable = clinicsTable
        , loginPage = Login.init
        , signupPage = Signup.init
        , history = [ currentRouter ]
        , currentPage = currentRouter
        }
