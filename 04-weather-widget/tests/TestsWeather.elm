module TestsWeather exposing (..)

import Test exposing (..)
import Expect
import Util.Weather exposing (weatherToType)
import Model exposing (..)


rainyWeather : Weather
rainyWeather =
    { id = 500, main = "Rain", description = "light rain", icon = "10n" }


drizzleWeather : Weather
drizzleWeather =
    { id = 302, main = "Drizzle", description = "heavy intensity drizzle", icon = "09d" }


clearWeatherDay : Weather
clearWeatherDay =
    { id = 800, main = "Clear", description = "clear sky", icon = "01d" }


clearWeatherNight : Weather
clearWeatherNight =
    { id = 800, main = "Clear", description = "clear sky", icon = "01n" }


snowWeather : Weather
snowWeather =
    { id = 602, main = "Snow", description = "heavy snow", icon = "13d" }


thunderStormWeather : Weather
thunderStormWeather =
    { id = 212, main = "Thunderstorm", description = "heavy thunderstorm", icon = "11d" }


tests : List Test
tests =
    [ test "Should display Storm for id 2XX" <| \() -> Expect.equal (weatherToType thunderStormWeather) Storm
    , test "Should display Rain for id 3XX" <| \() -> Expect.equal (weatherToType drizzleWeather) Rain
    , test "Should display Rain for id 5XX" <| \() -> Expect.equal (weatherToType rainyWeather) Rain
    , test "Should display Snow for id 6XX" <| \() -> Expect.equal (weatherToType snowWeather) Snow
    , test "Should display Clear for id 8XX" <| \() -> Expect.equal (weatherToType clearWeatherDay) SunnyDay
    , test "Should display Clear for id 8XX" <| \() -> Expect.equal (weatherToType clearWeatherNight) ClearNight
    ]
