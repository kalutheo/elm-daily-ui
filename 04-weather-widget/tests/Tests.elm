module Tests exposing (..)

import Test exposing (..)
import TestsWeather


all : Test
all =
    describe "A Test Suite"
        (List.concat [ TestsWeather.tests ])
