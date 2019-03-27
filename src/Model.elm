module Model exposing (..)

import Dict exposing (Dict)
import Array exposing (..)
import Time
import Msg exposing (..)
import Constants
import Note exposing (Note)
import Color
import Animations
import Animation
import Animation.Messenger


type alias Model =
    { isMIDIConnected : Maybe Bool
    , isPlaying : Bool
    , correctNote : Note
    , targetNotes : Array Note
    , nextTargetNoteIndex : Int
    , previousMidiCode : Maybe Int
    , currentNote : Maybe Note
    , score : Int
    , startTimestamp : Maybe Time.Posix
    , answerSpeed : Int -- result of subtracting two times via posixToMillis
    , incorrectTries : Int
    , scoreList : List Score -- store a list of score records for each practice session ... goes into local storage
    , testCurrentTimestamp : Maybe Time.Posix
    , sessionId : Int
    , uniqueAnimStates : Dict String (Animation.Messenger.State Msg)
    }

type alias Score =
  { correctNote : Note -- midi code of the Note (not the Note itself!)
  , answerSpeed : Int
  , incorrectTries : Int
  }

-- For views ... not sure where to put this =P
type alias Margins =
    { top : Float, right : Float, bottom : Float, left : Float }


initialModel : Model
initialModel =
    { isMIDIConnected = Nothing
    , isPlaying = False
    , correctNote = Note.createNote 60
    , targetNotes = Array.empty
    , nextTargetNoteIndex = 0
    , currentNote = Nothing
    , previousMidiCode = Nothing
    , score = 0
    , startTimestamp = Nothing
    , answerSpeed = 0
    , incorrectTries = 0
    , scoreList = []
    , testCurrentTimestamp = Nothing
    , sessionId = 0
    , uniqueAnimStates = Animations.initUniqueAnimStates
    }

