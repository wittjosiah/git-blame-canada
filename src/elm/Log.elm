module Log where

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, href, src)
import Signal exposing (Address)
import Date exposing (Date, fromTime)
import Date.Format exposing (format)
import String exposing (append)
import Router exposing (Route, match, (:->))
import History exposing (setPath, path, back, forward, length, hash)
import Signal exposing (Mailbox, mailbox, Signal, send, message)
import Task exposing (Task, sleep, andThen)

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

displayEntries _ hash length =
  section []
    [ headerView "git blame canada"
    , section [ class "log" ] (List.map entryView allEntries)
    , footerView
    ]

entryView : Entry -> Html
entryView entry =
  section [ class "entry" ]
    [ section [ class "hash" ] [ text (append "commit " entry.hash) ]
    , section [ class "user" ] [ text (append "Author:\t" entry.user) ]
    , section [ class "date" ] [ text (append "Date:\t" (format "%Y-%m-%d %H:%M:%S" entry.date)) ]
    , section [ class "description" ] [ text entry.description ] 
    ]

headerView : String -> Html
headerView headerText =
  header []
    [ img [ src "img/mapleleaf.png", class "header-img", onClick pathChangeMailbox.address (setPath "/" ) ] []
    , h1 [] [ text headerText ]
    ]

footerView : Html
footerView =
  footer []
    [ a [ onClick pathChangeMailbox.address (setPath "/" ) ] [ text "Home" ]
    , a [ onClick pathChangeMailbox.address (setPath "/about.html") ] [ text "About" ]
    , a [ href "http://github.com/wittjosiah/git-politic"] [ text "Source" ]
    ]

displayAbout _ hash length =
  section []
    [ headerView "git blame about"
    , section [ class "about" ] [ text "Git history of Justin Trudeau's time in office" ]
    , footerView
    ]

pathChangeMailbox : Mailbox (Task error ())
pathChangeMailbox = mailbox (Task.succeed ())

allEntries = 
  [ 
    { hash = "162d15a0c695fc8cf15dc1993a627e676194f59e"
    , user = "Justin Trudeau"
    , description = "I think Marc Garneau is a good fit for Minister of Transportation: he’s done some serious long distance travel"
    , date = fromTime 1446633000000
    }
  , { hash = "5ea46a84a408fc921ab082f22d2388dc977854ff"
    , user = "Justin Trudeau"
    , description = "Naming convention was off here: changing ‘Minister of Citizenship and Immigration’ to ‘Minister of Immigration, Refugees and Citizenship’"
    , date = fromTime 1446631200000
    }
  , { hash = "140c83ff510c1c5abe7be1d25944450b82ed371e"
    , user = "Justin Trudeau"
    , description = "Swearing in as Canada's 23rd Prime Minister. Got admin on this repo. First commit!"
    , date = fromTime 1446627600000
    }
  , { hash = "a5aa5f3ca56a685b2c346dc96f31146da72cc6e8"
    , user = "Canada"
    , description = "Voted in the National Election"
    , date = fromTime 1445295600000
    }
  ]

