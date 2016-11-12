module Messages exposing (..)

import ClinicsList.Messages as ClinicsList
import Login.Main as Login
import Signup.Main as Signup


type Msg
    = ClinicsListMsg ClinicsList.Msg
    | LoginMsg Login.Msg
    | SignupMsg Signup.Msg
