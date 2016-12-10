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
    ( { message = "What's the weather today ?", responseWeather = Nothing }, Cmd.none )


queryEscape : String -> String
queryEscape string =
    String.join "+" (String.split "%20" (Http.encodeUri string))


queryPair : ( String, String ) -> String
queryPair ( key, value ) =
    queryEscape key ++ "=" ++ queryEscape value


url : String -> List ( String, String ) -> String
url baseUrl args =
    case args of
        [] ->
            baseUrl

        _ ->
            baseUrl ++ "?" ++ String.join "&" (List.map queryPair args)


(:=) : String -> Decoder a -> Decoder a
(:=) =
    field


coordDecoder : Decoder Coord
coordDecoder =
    map2 Coord
        ("lat" := float)
        ("lon" := float)


weatherMainDecoder : Decoder WeatherMain
weatherMainDecoder =
    map5 WeatherMain
        ("temp" := float)
        ("pressure" := int)
        ("humidity" := int)
        ("temp_min" := float)
        ("temp_max" := float)


weatherDecoder : Decoder Weather
weatherDecoder =
    map4 Weather
        ("description" := string)
        ("id" := int)
        ("icon" := string)
        ("main" := string)


responseApiGetWeatherDecoder : Decoder ResponseApiWeather
responseApiGetWeatherDecoder =
    map4 ResponseApiWeather
        ("coord" := coordDecoder)
        ("main" := weatherMainDecoder)
        ("name" := string)
        ("weather" := list weatherDecoder)


getWeatherFromLocation : Geolocation.Location -> Cmd Msg
getWeatherFromLocation location =
    getWeather location.latitude location.longitude


getWeather : Float -> Float -> Cmd Msg
getWeather lat lon =
    let
        latitude =
            toString lat

        longitude =
            toString lon

        destUrl =
            url "http://api.openweathermap.org/data/2.5/weather"
                [ ( "lat", latitude )
                , ( "lon", longitude )
                , ( "APPID", "4573c189d467ca1814c1c10000060792" )
                ]
    in
        Http.send GetWeaterResult (Http.get destUrl responseApiGetWeatherDecoder)


geolocate : Cmd Msg
geolocate =
    Task.attempt GeocodeResult Geolocation.now


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        RequestWeather ->
            ( model, geolocate )

        GetWeaterResult (Ok response) ->
            ( { model | responseWeather = Just response }, Cmd.none )

        GetWeaterResult (Err error) ->
            let
                _ =
                    Debug.log "GetWeaterResult:Err" error
            in
                ( model, Cmd.none )

        GeocodeResult (Ok response) ->
            ( model, getWeatherFromLocation response )

        GeocodeResult (Err error) ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    widget model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
