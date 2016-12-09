module Msg exposing (..)

import Geolocation
import Http
import Model exposing (ResponseApiWeather)


type Msg
    = NoOp
    | GeocodeResult (Result Geolocation.Error Geolocation.Location)
    | RequestWeather
    | GetWeaterResult (Result Http.Error ResponseApiWeather)
