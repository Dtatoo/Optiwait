module ClinicsList.Messages exposing (..)

import Table


type Msg
    = SetQuery String
    | SetTableState Table.State
