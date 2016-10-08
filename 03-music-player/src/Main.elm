port module Main exposing (..)

import View exposing (view)
import Html.App as App
import Update exposing (init, update)
import Msg exposing (..)
import Model exposing (..)
import Ports exposing (..)


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
