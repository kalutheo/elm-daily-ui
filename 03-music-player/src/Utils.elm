module Utils exposing (..)

import Model exposing (..)
import Array


nextTrack : Track -> PlayList -> Maybe Int
nextTrack currentTrack playlist =
    findIndex (\t -> t == currentTrack) <| Array.fromList playlist


findIndex pred arr =
    let
        findIndexStartingAt i =
            Array.get i arr
                `Maybe.andThen`
                    (\elem ->
                        if pred elem then
                            Just i
                        else
                            findIndexStartingAt (i + 1)
                    )
    in
        findIndexStartingAt 0


addLeadingZero : Int -> String
addLeadingZero value =
    if value < 10 then
        "0" ++ (value |> toString)
    else
        value |> toString


msToTime : Float -> String
msToTime duration =
    let
        seconds =
            (duration / 1000 |> round) % 60

        minutes =
            (duration / (1000 * 60) |> round) % 60
    in
        addLeadingZero minutes ++ ":" ++ addLeadingZero seconds
