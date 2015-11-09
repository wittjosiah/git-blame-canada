module Log where

import Html exposing (..)
import Html.Attributes exposing (class)
import Signal exposing (Address)
import Date exposing (Date)
import Date.Format exposing (format)
import String exposing (append)

-- MODEL

type alias Model = List Entry

type alias Entry =
  { user : String
  , description : String
  , date : Date
  , hash : String
  }

-- UPDATE

type Action = Nothing

update : Action -> Model -> Model
update action model =
  case action of
    Nothing -> model

-- VIEW

view : Address Action -> Model -> Html
view address model =
  section [ class "log" ]
    (List.map entryView model)

entryView : Entry -> Html
entryView entry =
  section [ class "entry" ]
    [ section [ class "hash" ] [ text (append "commit " entry.hash) ]
    , section [ class "user" ] [ text (append "Author:\t" entry.user) ]
    , section [ class "date" ] [ text (append "Date:\t" (format "%Y-%m-%d %H:%M:%S" entry.date)) ]
    , section [ class "description" ] [ text entry.description ] 
    ]

