module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import App
import TestsWeather


defaultTests : List Test
defaultTests =
    [ test "App.model.message should be set properly" <|
        \() ->
            Expect.equal (Tuple.first App.init |> .message) "What's the weather today ?"
    , test "Addition" <|
        \() ->
            Expect.equal (3 + 7) 10
    , test "String.left" <|
        \() ->
            Expect.equal "a" (String.left 1 "abcdefg")
    ]


all : Test
all =
    describe "A Test Suite"
        (List.concat [ TestsWeather.tests, defaultTests ])
