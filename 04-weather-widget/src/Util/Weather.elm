module Util.Weather exposing (..)

import Model exposing (..)
import Dict


weathers =
    [ ( "snow", Snow )
    , ( "sunny", SunnyDay )
    , ( "night", ClearNight )
    , ( "storm", Storm )
    , ( "rain", Rain )
    , ( "unknown", Unknown )
    ]


findWeatherTypeByName : String -> Maybe WeatherType
findWeatherTypeByName name =
    Dict.get name (Dict.fromList weathers)


weatherToLabel : WeatherType -> String
weatherToLabel weather =
    case weather of
        Snow ->
            "snow"

        SunnyDay ->
            "sunny"

        ClearNight ->
            "night"

        Rain ->
            "rain"

        Storm ->
            "storm"

        Unknown ->
            "unknown"



{- http://openweathermap.org/weather-conditions -}


isBetween : Weather -> Int -> Int -> Bool
isBetween weather min max =
    weather.id >= min && weather.id < max


weatherToType : Weather -> WeatherType
weatherToType weather =
    let
        isNight =
            String.contains "n" weather.icon
    in
        if isBetween weather 200 300 then
            Storm
        else if isBetween weather 300 600 then
            Rain
        else if isBetween weather 600 700 then
            Snow
        else if isBetween weather 800 900 then
            if isNight then
                ClearNight
            else
                SunnyDay
        else
            Unknown


kelvinToCelsius : Float -> Float
kelvinToCelsius temp =
    temp - 273.15
