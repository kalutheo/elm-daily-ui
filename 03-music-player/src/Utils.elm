module Utils exposing (..)


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
