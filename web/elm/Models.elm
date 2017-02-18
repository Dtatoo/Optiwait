module Models exposing (AppModel, init)

import Navigation
import Routing exposing (Route, route, getRoute)
import ClinicsList.Models as ClinicsList
import Messages exposing (Msg(..))
import Login.Main as Login
import Signup.Models as Signup
import AddClinic.Models as AddClinic
import MenuBar


type alias AppModel =
    { currentPage : Route
    , history : List Route
    , menu : MenuBar.Model
    , clinicsList : ClinicsList.Model
    , login : Login.Model
    , signup : Signup.Model
    , addClinic : AddClinic.Model
    }


init : Navigation.Location -> ( AppModel, Cmd Msg )
init location =
    let
        -- Routing
        currentRoute =
            getRoute location

        -- MenuBar
        ( menuInit, menuCmds ) =
            MenuBar.init

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
        { currentPage = currentRoute
        , history = [ currentRoute ]
        , menu = menuInit
        , clinicsList = clinicsListInit
        , login = loginInit
        , signup = signupInit
        , addClinic = addClinicInit
        }
            ! [ Cmd.batch
                    [ Cmd.map MenuBarMsg menuCmds
                    , Cmd.map ClinicsListMsg clinicsTableCmds
                    , Cmd.map LoginMsg loginCmds
                    , Cmd.map SignupMsg signupCmds
                    , Cmd.map AddClinicMsg addClinicCmds
                    ]
              ]
