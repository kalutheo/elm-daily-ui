module App exposing (..)

import Html exposing (Html, text, div)
import View.Widget exposing (..)
import Model exposing (Model)
import Geolocation
import Task


init : ( Model, Cmd Msg )
init =
    ( { message = "Your Elm App is working!" }, geolocate )


geolocate : Cmd Msg
geolocate =
    Task.attempt GeocodeResult Geolocation.now


type Msg
    = NoOp
    | GeocodeResult (Result Geolocation.Error Geolocation.Location)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GeocodeResult (Ok response) ->
            let
                _ =
                    Debug.log "GeocodeResult:OK" response
            in
                ( model, Cmd.none )

        GeocodeResult (Err error) ->
            let
                _ =
                    Debug.log "GeocodeResult:ERR" error
            in
                ( model, Cmd.none )


view : Model -> Html Msg
view model =
    widget model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
