module App exposing (..)

import Html exposing (Html, text, div)
import View.Widget exposing (..)
import Model exposing (..)
import Geolocation
import Task
import Msg exposing (..)
import Json.Decode exposing (..)
import Http


init : ( Model, Cmd Msg )
init =
    ( { message = "What's the weather today ?" }, Cmd.none )


(:=) : String -> Decoder a -> Decoder a
(:=) =
    field


coordDecoder : Decoder Coord
coordDecoder =
    map2 Coord
        ("lat" := float)
        ("lon" := float)


weatherDecoder : Decoder Weather
weatherDecoder =
    map5 Weather
        ("temp" := float)
        ("pressure" := int)
        ("humidity" := int)
        ("temp_min" := float)
        ("temp_max" := float)


responseApiGetWeatherDecoder : Decoder ResponseApiWeather
responseApiGetWeatherDecoder =
    map3 ResponseApiWeather
        ("coord" := coordDecoder)
        ("weather" := weatherDecoder)
        ("name" := string)


getWeather : Float -> Float -> Cmd Msg
getWeather lat lon =
    let
        latitude =
            toString lat

        longitude =
            toString lon

        url =
            "http://api.openweathermap.org/data/2.5/weather?lat=" ++ latitude ++ "&lon=" ++ longitude ++ "APPID=4573c189d467ca1814c1c10000060792"
    in
        Http.send GetWeaterResult (Http.get url responseApiGetWeatherDecoder)


geolocate : Cmd Msg
geolocate =
    Task.attempt GeocodeResult Geolocation.now



--|> andThen (\location -> getWeather location.latitude location.longitude)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        RequestWeather ->
            ( model, geolocate )

        GetWeaterResult (Ok response) ->
            let
                _ =
                    Debug.log "GetWeaterResult:OK" response
            in
                ( model, Cmd.none )

        GetWeaterResult (Err error) ->
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
