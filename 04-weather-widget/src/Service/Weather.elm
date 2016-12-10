module Service.Weather exposing (getWeatherFromLocation)

import Json.Decode exposing (..)
import Model exposing (Coord, Weather, WeatherMain, ResponseApiWeather)
import Util.Http as UtilHttp exposing ((:=))
import Msg exposing (..)
import Http
import Geolocation


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
            UtilHttp.url "http://api.openweathermap.org/data/2.5/weather"
                [ ( "lat", latitude )
                , ( "lon", longitude )
                , ( "APPID", "4573c189d467ca1814c1c10000060792" )
                ]
    in
        Http.send GetWeaterResult (Http.get destUrl responseApiGetWeatherDecoder)
