module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onSubmit)


main : Program Never
main =
    beginnerProgram { model = update Show model, view = view, update = update }



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
    = None
    | Show
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Show ->
            { model | status = Shown }

        Submit ->
            { model | status = Hidden }

        None ->
            model



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
                            [ input [ placeholder "Jack-Edward Oliver", attribute "required" "", type' "text" ]
                                []
                            , label []
                                []
                            ]
                        , div [ class "Input" ]
                            [ input [ placeholder "mrjackolai@gmail.com", attribute "required" "", type' "email" ]
                                []
                            , label []
                                []
                            ]
                        , div [ class "Input" ]
                            [ input [ placeholder "password", attribute "required" "", type' "password" ]
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
