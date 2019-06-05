module Msg exposing (Msg(..))

import Time

type Msg
    = InitMIDI Bool
    | NotePressed Int
    | NoteReleased Bool
    
    | GenerateTargetNotes (List Int)
    | StartGame
    | RestartTimer Time.Posix
    | AnimFrame Time.Posix

