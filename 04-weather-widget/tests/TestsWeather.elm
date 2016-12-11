module TestsWeather exposing (..)

import Test exposing (..)
import Expect
import Util.Weather exposing (weatherToType)
import Model exposing (..)


rainyWeather : Weather
rainyWeather =
    { id = 500, main = "Rain", description = "light rain", icon = "10n" }


clearWeatherDay : Weather
clearWeatherDay =
    { id = 800, main = "Clear", description = "clear sky", icon = "01d" }


thunderStormWeather : Weather
thunderStormWeather =
    { id = 212, main = "Thunderstorm", description = "heavy thunderstorm", icon = "11d" }


tests : List Test
tests =
    [ test "Should display Clear for id 2XX" <| \() -> Expect.equal (weatherToType thunderStormWeather) Storm
    , test "Should display Rain for id 5XX" <| \() -> Expect.equal (weatherToType rainyWeather) Rain
    , test "Should display Clear for id 8XX" <| \() -> Expect.equal (weatherToType clearWeatherDay) SunnyDay
    ]
