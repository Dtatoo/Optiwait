module ClinicsList.Update exposing (update)

import ClinicsList.Model exposing (ClinicsTable)
import ClinicsList.Messages exposing (Msg(..))


update : Msg -> ClinicsTable -> ( ClinicsTable, Cmd Msg )
update msg model =
    case msg of
        SetQuery newQuery ->
            ( { model | query = newQuery }
            , Cmd.none
            )

        SetTableState newState ->
            ( { model | tableState = newState }
            , Cmd.none
            )
