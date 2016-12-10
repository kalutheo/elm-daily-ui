module Util.Weather exposing (..)

import Model exposing (..)
import Dict


weathers =
    [ ( "snow", Snow )
    , ( "sunny", SunnyDay )
    , ( "night", ClearNight )
    , ( "storm", Storm )
    , ( "rain", Rain )
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


weatherToType : Weather -> WeatherType
weatherToType weather =
    if weather.id >= 500 then
        Rain
    else
        SunnyDay
