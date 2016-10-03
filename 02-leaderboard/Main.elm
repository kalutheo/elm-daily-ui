module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (program)
import Json.Decode exposing (..)
import Http
import Task


main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( model, getPeople )



-- Helper --


css : String -> Html a
css path =
    node "link" [ rel "stylesheet", href path ] []



-- Model --


type alias Character =
    { name : String
    , height : String
    , gender : String
    }


type alias ResponseApiPeople =
    { count : Int
    , next : String
    , previous : Maybe String
    , results : List Character
    }


type alias Model =
    { title : String
    , characters : List Character
    }


model : Model
model =
    { title = "loading..."
    , characters = []
    }



-- Update --


type Msg
    = NoOp
    | FetchPeople
    | FetchPeopleSucceeded ResponseApiPeople
    | FetchPeopleFailed Http.Error


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        NoOp ->
            ( model, Cmd.none )

        FetchPeople ->
            ( model, Cmd.none )

        FetchPeopleSucceeded response ->
            ( { model | title = "Most active players", characters = response.results }, Cmd.none )

        FetchPeopleFailed err ->
            ( model, Cmd.none )



-- View --


characterEntryView : Character -> Html Msg
characterEntryView character =
    li []
        [ em []
            [ text character.name ]
        , strong []
            [ text character.height ]
        ]


leaderBoardView : Model -> Html Msg
leaderBoardView model =
    div []
        [ section [ class "players" ]
            [ h1 []
                [ text model.title ]
            , ol []
                (List.map (\character -> characterEntryView character) model.characters |> List.take 5)
            ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ leaderBoardView model
        , css "https://codepen.io/webandapp/pen/bppNeG.css"
        ]



-- api


getPeople : Cmd Msg
getPeople =
    Task.perform FetchPeopleFailed FetchPeopleSucceeded (Http.get responseApiPeopleDecoder "http://swapi.co/api/people")



-- JSON Decoding --


responseApiPeopleDecoder : Decoder ResponseApiPeople
responseApiPeopleDecoder =
    object4 ResponseApiPeople
        ("count" := int)
        ("next" := string)
        ("previous" := nullOr string)
        ("results" := Json.Decode.list characterDecoder)


nullOr : Decoder a -> Decoder (Maybe a)
nullOr decoder =
    oneOf
        [ null Nothing
        , map Just decoder
        ]


characterDecoder : Decoder Character
characterDecoder =
    object3 Character
        ("name" := string)
        ("height" := string)
        ("gender" := string)
