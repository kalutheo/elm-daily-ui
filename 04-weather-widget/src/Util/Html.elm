module Util.Html exposing (..)


classNames : List ( String, Bool ) -> String
classNames list =
    List.map Tuple.first list |> String.join " "
