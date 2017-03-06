module ClinicsList.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (placeholder, class, id, src, alt)
import Html.Events exposing (onInput)
import String
import Table exposing (defaultCustomizations)
import ClinicsList.Models exposing (ClinicInfo, Model)
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
    [ id "main-table" ]


view : Model -> Html Msg
view { clinics, tableState, query } =
    let
        lowerQuery =
            String.toLower query

        acceptableNames =
            List.filter (String.contains lowerQuery << String.toLower << .name) clinics
    in
        div []
            [ div [ class "padding flex flex-center" ]
                [ input [ class "full-width padding", placeholder "Search Clinics By Name", onInput SetQuery ] []
                ]
            , Table.view advancedConfig tableState acceptableNames
            ]
