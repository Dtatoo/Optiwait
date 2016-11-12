module Messages exposing (..)

import ClinicsList.Messages
import Login.Main as Login
import Signup.Main as GooglePlaces


type Msg
    = ClinicsListMsg ClinicsList.Messages.Msg
    | LoginMsg Login.Msg
    | SignupMsg GooglePlaces.Msg
