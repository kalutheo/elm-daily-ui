module View exposing (..)

import Html exposing (text, Html, div, i, ul, li)
import Html.Attributes exposing (class, attribute, id)
import Html.Events exposing (onClick)
import Msg exposing (..)
import Model exposing (Model, Track)
import String.Extra exposing (ellipsis)
import Utils exposing (..)


trackView : Int -> Track -> Html Msg
trackView index track =
    li [ onClick <| SelectTrack track ]
        [ div [ class "number" ]
            [ text <| toString (index + 1) ]
        , div [ class "title" ]
            [ text <| ellipsis 28 track.name ]
        , div [ class "duration" ]
            [ text <| (track.duration |> toFloat |> msToTime) ]
        ]


playPauseView : Model -> Html Msg
playPauseView model =
    if model.isPlaying then
        i [ class "fa fa-fw fa-pause", id "pause", onClick Pause ]
            []
    else
        i [ class "fa fa-fw fa-play", id "play", onClick Play ]
            []


view : Model -> Html Msg
view model =
    div [ class "App", attribute "data-reactroot" "" ]
        [ div [ class "Artwork", attribute "style" "background-image: url('https://i.scdn.co/image/d025af49bb84dbb26393f42ff9646f1c748c3035');" ]
            [ div [ class "Controls" ]
                [ i [ class "fa fa-fw fa-fast-backward", onClick Next ]
                    []
                , playPauseView model
                , i [ class "fa fa-fw fa-fast-forward", onClick Previous ]
                    []
                ]
            ]
        , ul [ class "TrackList" ] (List.indexedMap (\i track -> trackView i track) model.album.playlist)
        ]
