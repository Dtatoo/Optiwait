module Models exposing (AppModel, init)

import Navigation
import UrlParser exposing (parseHash)
import Routing exposing (Route, route)
import ClinicsList.Models as ClinicsList
import Messages exposing (Msg(..))
import Login.Main as Login
import Signup.Models as Signup
import AddClinic.Models as AddClinic


type alias AppModel =
    { currentPage : Maybe Route
    , history : List (Maybe Route)
    , clinicsList : ClinicsList.Model
    , login : Login.Model
    , signup : Signup.Model
    , addClinic : AddClinic.Model
    }


init : Navigation.Location -> ( AppModel, Cmd Msg )
init location =
    let
        -- Routing
        currentRouter =
            parseHash route location

        -- Pages Models + Cmds initializations
        ( clinicsListInit, clinicsTableCmds ) =
            ClinicsList.init

        ( loginInit, loginCmds ) =
            Login.init

        ( signupInit, signupCmds ) =
            Signup.init

        ( addClinicInit, addClinicCmds ) =
            AddClinic.init
    in
        { currentPage = currentRouter
        , history = [ currentRouter ]
        , clinicsList = clinicsListInit
        , login = loginInit
        , signup = signupInit
        , addClinic = addClinicInit
        }
            ! [ Cmd.batch
                    [ Cmd.map ClinicsListMsg clinicsTableCmds
                    , Cmd.map LoginMsg loginCmds
                    , Cmd.map SignupMsg signupCmds
                    , Cmd.map AddClinicMsg addClinicCmds
                    ]
              ]
