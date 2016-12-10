module Service.Geolocation exposing (..)

import Task
import Msg exposing (..)
import Geolocation


geolocate : Cmd Msg
geolocate =
    Task.attempt GeocodeResult Geolocation.now
