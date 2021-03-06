module Model exposing (..)

import RemoteData exposing (..)


type alias Model =
    { message : String
    , responseWeather : RemoteData String ResponseApiWeather
    }


type alias Coord =
    { lon : Float
    , lat : Float
    }


type alias WeatherMain =
    { temp : Float
    , pressure : Int
    , humidity : Int
    , temp_min : Float
    , temp_max : Float
    }


type WeatherType
    = Snow
    | Rain
    | SunnyDay
    | ClearNight
    | Storm
    | Mist
    | Unknown


type alias Weather =
    { description : String
    , id : Int
    , icon : String
    , main : String
    }


type alias ResponseApiWeather =
    { coord : Coord
    , main : WeatherMain
    , name : String
    , weather : List Weather
    }


initialModel : Model
initialModel =
    { message = "What's the weather today ?", responseWeather = NotAsked }
