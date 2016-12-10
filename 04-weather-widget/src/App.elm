module App exposing (..)

import Html exposing (Html)
import View.Widget exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Service.Weather as ServiceWeather
import Service.Geolocation as ServiceGeolocation


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        RequestWeather ->
            ( model, ServiceGeolocation.geolocate )

        GetWeaterResult (Ok response) ->
            ( { model | responseWeather = Just response }, Cmd.none )

        GetWeaterResult (Err error) ->
            ( model, Cmd.none )

        GeocodeResult (Ok response) ->
            ( model, ServiceWeather.getWeatherFromLocation response )

        GeocodeResult (Err error) ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    widget model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
