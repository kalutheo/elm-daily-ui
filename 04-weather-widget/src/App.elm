module App exposing (..)

import Html exposing (Html, text, div)
import View.Widget exposing (..)
import Model exposing (Model)


init : ( Model, Cmd Msg )
init =
    ( { message = "Your Elm App is working!" }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    widget model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
