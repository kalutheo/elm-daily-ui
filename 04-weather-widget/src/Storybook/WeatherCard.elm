port module Storybook.WeatherCard exposing (..)

import Util.Storybook exposing (storybookApp)
import Msg exposing (..)
import Model exposing (..)
import View.Card as Card
import Util.Weather as UtilWeather
import Html exposing (div)


type alias StoryModel =
    { deg : Int
    , label : String
    , weather : String
    }



-- APP


main : Program StoryModel StoryModel Msg
main =
    storybookApp
        { view =
            \model ->
                let
                    maybeWeatherType =
                        UtilWeather.findWeatherTypeByName (model.weather)
                in
                    case maybeWeatherType of
                        Just weatherType ->
                            Card.view weatherType model.deg model.label

                        Nothing ->
                            div [] []
        }
