module Messages exposing (..)

import ClinicsList.Messages
import Login.Main as Login
import GooglePlaces.Main as GooglePlaces


type Msg
    = ClinicsListMsg ClinicsList.Messages.Msg
    | LoginMsg Login.Msg
    | SignupMsg GooglePlaces.Msg
