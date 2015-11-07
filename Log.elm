module Log where

import Html exposing (..)
import Html.Attributes exposing (style)
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
  section [ mainStyle ]
    (List.map entryView model)

entryView : Entry -> Html
entryView entry =
  section []
    [ section [ hashStyle ] [ text (append "commit " entry.hash) ]
    , section [ userStyle ] [ text (append "Author:\t" entry.user) ]
    , section [ dateStyle ] [ text (append "Date:\t" (format "%Y-%m-%d %H:%M:%S" entry.date)) ]
    , section [ descStyle ] [ text entry.description ] 
    ]

font : List (String, String)
font =
    [ ("font-size", "14px")
    , ("font-family", "monospace")
    , ("font-face", "consolas")
    ]

mainStyle : Attribute
mainStyle =
  style
    (font ++
    [ ("margin", "20px 0 0 20px")
    , ("background-color", "black")
    ])

hashStyle : Attribute
hashStyle =
  style
    [ ("color", "yellow") 
    ]

userStyle : Attribute
userStyle =
  style
    [ ("color", "lime")
    ]

dateStyle : Attribute
dateStyle =
  style
    [ ("color", "lime")
    ]

descStyle : Attribute
descStyle =
  style
    [ ("color", "lime")
    , ("margin", "20px 0 20px 30px")
    ]

