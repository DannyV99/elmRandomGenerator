module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Random



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( 0, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    Int



-- UPDATE


type Msg
    = GotRandom Int
    | ProduceRandom


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotRandom x ->
            ( x, Cmd.none )

        ProduceRandom ->
            ( model, Random.generate GotRandom <| Random.int 0 9 )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text <| String.fromInt model ]
        , button [ onClick ProduceRandom ] [ text "Random Buttom" ]
        ]
