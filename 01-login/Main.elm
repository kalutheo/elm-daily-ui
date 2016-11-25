module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram, program)
import Html.Events exposing (onSubmit)
import Process
import Time exposing (..)
import Task


main : Program Never Model Msg
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


showModalWithDelayCmd : Cmd Msg
showModalWithDelayCmd =
    Process.sleep (0.5 * second)
        |> Task.perform (\_ -> Show)


init : ( Model, Cmd Msg )
init =
    ( model, showModalWithDelayCmd )



-- Helper --


css : String -> Html a
css path =
    node "link" [ rel "stylesheet", href path ] []



-- Model --


type Status
    = Default
    | Shown
    | Hidden


type alias Model =
    { status : Status
    }


model : Model
model =
    { status = Default }



-- Update --


type Msg
    = NoOp
    | Show
    | Submit


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        Show ->
            ( { model | status = Shown }, Cmd.none )

        Submit ->
            ( { model | status = Hidden }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



-- View --


getModalClassList : Status -> Attribute a
getModalClassList status =
    case status of
        Default ->
            classList [ ( "Modal", True ), ( "example-enter", True ) ]

        Hidden ->
            classList
                [ ( "Modal", True )
                , ( "example-leave", True )
                , ( "example-leave-active", True )
                ]

        Shown ->
            classList
                [ ( "Modal", True )
                , ( "example-enter", True )
                , ( "example-enter-active", True )
                ]


modalView : Model -> Html Msg
modalView model =
    let
        modalClassList =
            getModalClassList model.status
    in
        div [ class "App" ]
            [ span []
                [ div [ modalClassList ]
                    [ Html.form [ class "ModalForm", onSubmit Submit ]
                        [ div [ class "Input" ]
                            [ input [ placeholder "Jack-Edward Oliver", attribute "required" "", type_ "text" ]
                                []
                            , label []
                                []
                            ]
                        , div [ class "Input" ]
                            [ input [ placeholder "mrjackolai@gmail.com", attribute "required" "", type_ "email" ]
                                []
                            , label []
                                []
                            ]
                        , div [ class "Input" ]
                            [ input [ placeholder "password", attribute "required" "", type_ "password" ]
                                []
                            , label []
                                []
                            ]
                        , button []
                            [ span []
                                [ text "Log in " ]
                            , i [ class "fa fa-fw fa-chevron-right" ]
                                []
                            ]
                        ]
                    ]
                ]
            ]


view : Model -> Html Msg
view model =
    div []
        [ modalView model
        , css "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"
        , css "http://codepen.io/jackoliver/pen/qNwrrp.css"
        ]
