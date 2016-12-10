module Util.Weather exposing (..)

import Model exposing (..)


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
