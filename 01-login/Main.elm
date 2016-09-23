import Html exposing (..)
import Html.Attributes exposing (..)

import Html.App exposing (beginnerProgram)

main: Program Never
main =
  beginnerProgram { model = model, view = view, update = update }

-- Helper --

css: String -> Html a
css path =
  node "link" [ rel "stylesheet", href path ] []

-- Model --

type alias Model = {
  login: String
}

model: Model
model = {login=""}

-- Update --

type Msg = None | Submit

update: Msg Model -> a -> a
update msg model =
  case msg of
    _ -> model


-- View --

modalView: Html a
modalView =
 div [ class "App" ]
    [ span []
        [ div [ class "Modal" ]
            [ Html.form [ class "ModalForm" ]
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
                , div [ class "Input"]
                    [ input [ placeholder "password", attribute "required" "", type' "password" ]
                        []
                    , label []
                        []
                    ]
                , button []
                    [ span []
                        [ text "Log in " ]
                    , i [ class "fa fa-fw fa-chevron-right"]
                        []
                    ]
                ]
            ]
        ]
    ]


view: Model -> Html a
view model =
  div []
    [
      modalView
    , css "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"
    , css "http://codepen.io/jackoliver/pen/qNwrrp.css"
    ]
