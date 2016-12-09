module Model exposing (..)


type alias Model =
    { message : String
    }


type alias Coord =
    { lon : Float
    , lat : Float
    }


type alias Weather =
    { temp : Float
    , pressure : Int
    , humidity : Int
    , temp_min : Float
    , temp_max : Float
    }


type alias ResponseApiWeather =
    { coord : Coord
    , weather : Weather
    , name : String
    }
