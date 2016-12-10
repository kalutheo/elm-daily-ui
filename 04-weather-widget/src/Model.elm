module Model exposing (..)


type alias Model =
    { message : String
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
