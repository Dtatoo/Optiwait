module Messages exposing (..)

import Navigation
import ClinicsList.Messages as ClinicsList
import Login.Main as Login
import Signup.Main as Signup
import AddClinic.Main as AddClinic


type Msg
    = NewUrl String
    | UrlChange Navigation.Location
    | ClinicsListMsg ClinicsList.Msg
    | LoginMsg Login.Msg
    | SignupMsg Signup.Msg
    | AddClinicMsg AddClinic.Msg
