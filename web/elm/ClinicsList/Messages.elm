module ClinicsList.Messages exposing (Msg(..))

import Table


type Msg
    = SetQuery String
    | SetTableState Table.State
