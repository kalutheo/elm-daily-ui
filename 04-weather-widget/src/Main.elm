module Main exposing (..)

import App exposing (..)
import Msg exposing (..)
import Model exposing (..)
import Html exposing (program)


main : Program Never Model Msg
main =
    program { view = view, init = init, update = update, subscriptions = subscriptions }
