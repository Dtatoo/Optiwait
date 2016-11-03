module ClinicsList.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (placeholder, class)
import Html.Events exposing (onInput)
import String
import Table exposing (defaultCustomizations)
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


advancedConfig : Table.Config ClinicInfo Msg
advancedConfig =
    Table.customConfig
        { toId = .name
        , toMsg = SetTableState
        , columns =
            [ Table.stringColumn "Name" .name
            , Table.stringColumn "Location" .location
            ]
        , customizations =
            { defaultCustomizations | tableAttrs = tableCssAttrs }
        }


tableCssAttrs : List (Attribute Msg)
tableCssAttrs =
    [ class "c-table" ]


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
            , Table.view advancedConfig tableState acceptableNames
            ]
