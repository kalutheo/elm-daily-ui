module Update exposing (..)

import Model exposing (Model, model)
import Msg exposing (..)
import Ports exposing (play, load, pause)


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectTrack track ->
            ( { model | isPlaying = True, selectedTrack = Just track }, load track )

        Play ->
            ( { model | isPlaying = True }, play () )

        Pause ->
            ( { model | isPlaying = False }, pause () )

        Next ->
            ( model, Cmd.none )

        Previous ->
            ( model, Cmd.none )
