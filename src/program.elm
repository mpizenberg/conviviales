module Main exposing (..)

import Html as H exposing (Html)
import Html.Attributes as HA
import Html.Events as HE
import Array exposing (Array)
import Dict exposing (Dict)
import Time exposing (Time)


main =
    H.program
        { init = init
        , update = update
        , subscriptions = subs
        , view = view
        }



-- MODEL #############################################################


type Sex
    = Male
    | Female
    | Unknown


type alias Contact =
    { firstname : String
    , lastname : String
    , age : Int
    , sex : Sex
    , phone : String
    , email : String
    }


type TennisRank
    = NC
    | Rank_40
    | Rank_30_5
    | Rank_30_4
    | Rank_30_3
    | Rank_30_2
    | Rank_30_1
    | Rank_30
    | Rank_15_5
    | Rank_15_4
    | Rank_15_3
    | Rank_15_2
    | Rank_15_1
    | Rank_15
    | Rank_5_6
    | Rank_4_6
    | Rank_3_6
    | Rank_2_6
    | Rank_1_6
    | Rank_0


type alias TennisLevel =
    { rank : TennisRank
    , level : TennisRank
    }


type GroupAssignment
    = GroupManual Int
    | GroupAuto


type alias Player =
    { contact : Contact
    , level : TennisLevel
    , groupAssignment : GroupAssignment
    }


type alias Score =
    ( Int, Int )


type GameResult
    = Abandon Int Score
    | Ended Score


type alias Game =
    { group : Int
    , players : ( Int, Int )
    , duration : Time
    , result : GameResult
    }


type alias Model =
    { players : Dict Int Player
    , groups : Array (List Int)
    , games : List Game
    }


initialPlayers : Dict Int Player
initialPlayers =
    Dict.fromList
        [ ( 0
          , Player
                (Contact "Christophe" "Pizenberg" 55 Male "06********" "chris@gmail.com")
                (TennisLevel Rank_30_1 Rank_30)
                (GroupAuto)
          )
        , ( 1
          , Player
                (Contact "Youna" "Pizenberg" 47 Female "06********" "youna@gmail.com")
                (TennisLevel NC Rank_30_3)
                (GroupAuto)
          )
        , ( 2
          , Player
                (Contact "Matthieu" "Pizenberg" 25 Male "06********" "matt@gmail.com")
                (TennisLevel NC Rank_30_1)
                (GroupAuto)
          )
        , ( 3
          , Player
                (Contact "Quentin" "Pizenberg" 22 Male "06********" "quentin@gmail.com")
                (TennisLevel NC Rank_30_1)
                (GroupAuto)
          )
        , ( 4
          , Player
                (Contact "Marine" "Pizenberg" 20 Female "06********" "marine@gmail.com")
                (TennisLevel NC Rank_30_4)
                (GroupAuto)
          )
        ]


initialGroups : Array (List Int)
initialGroups =
    Array.fromList
        [ [ 0, 2, 3 ]
        , [ 1, 4 ]
        ]


initialGames : List Game
initialGames =
    [ Game 0 ( 0, 2 ) (1 * Time.hour) (Abandon 1 ( 3, 4 ))
    , Game 0 ( 0, 3 ) (2 * Time.hour) (Ended ( 1, 12 ))
    , Game 1 ( 1, 4 ) (1 * Time.hour) (Ended ( 5, 5 ))
    ]


initialModel : Model
initialModel =
    { players = initialPlayers
    , groups = initialGroups
    , games = initialGames
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel
    , Cmd.none
    )



-- UPDATE ############################################################


type Msg
    = Msg1
    | Msg2


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model
            , Cmd.none
            )



-- SUBS ##############################################################


subs : Model -> Sub Msg
subs model =
    Sub.none



-- VIEW ##############################################################


view : Model -> Html Msg
view model =
    H.div [] []
