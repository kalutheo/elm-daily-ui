module Update exposing (..)

import Model exposing (Model, model)
import Msg exposing (..)
import Ports exposing (play, load, loadAndPlay, pause)
import Array
import Utils exposing (findIndex)


init : ( Model, Cmd Msg )
init =
    let
        firstTrack =
            Array.fromList model.album.playlist |> Array.get 0
    in
        case firstTrack of
            Nothing ->
                ( model, Cmd.none )

            Just track ->
                ( { model | selectedTrack = Just track }, load track )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectTrack track ->
            ( { model | isPlaying = True, selectedTrack = Just track }, loadAndPlay track )

        Play ->
            ( { model | isPlaying = True }, play () )

        Pause ->
            ( { model | isPlaying = False }, pause () )

        Next ->
            let
                _ =
                    Debug.log "model" model

                _ =
                    Debug.log "findIndex" <|
                        findIndex
                            (\t ->
                                case Debug.log "selectedTrack" model.selectedTrack of
                                    Nothing ->
                                        False

                                    Just track ->
                                        t == track
                            )
                        <|
                            Array.fromList model.album.playlist
            in
                ( model, Cmd.none )

        Previous ->
            ( model, Cmd.none )
