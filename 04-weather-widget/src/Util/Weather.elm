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


weatherDict =
    Dict.fromList weathers


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
    if isBetween weather 200 300 then
        Storm
    else if isBetween weather 500 600 then
        Rain
    else if isBetween weather 800 900 then
        SunnyDay
    else
        Unknown
