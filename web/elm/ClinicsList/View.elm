module ClinicsList.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String
import Table
import ClinicsList.Model exposing (ClinicInfo, ClinicsTable)
import ClinicsList.Messages exposing (Msg(..))


config : Table.Config ClinicInfo Msg
config =
    Table.config
        { toId = .name
        , toMsg = SetTableState
        , columns =
            [ Table.stringColumn "Name" .name
            , Table.stringColumn "Location" .location
            ]
        }


view : ClinicsTable -> Html Msg
view { clinics, tableState, query } =
    let
        lowerQuery =
            String.toLower query

        acceptableNames =
            List.filter (String.contains lowerQuery << String.toLower << .name) clinics
    in
        div []
            [ h1 [] [ text "Clinics" ]
            , input [ placeholder "Search By Name", onInput SetQuery ] []
            , Table.view config tableState acceptableNames
            ]
