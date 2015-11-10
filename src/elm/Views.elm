module Views where

import Html             exposing (..)
import Html.Events      exposing (onClick)
import Html.Attributes  exposing (class, href, src)
import Signal           exposing (Address)
import Date             exposing (Date, fromTime)
import Date.Format      exposing (format)
import String           exposing (append)
import Router           exposing (Route, match, (:->))
import History          exposing (setPath, path, back, forward, length, hash)
import Signal           exposing (Mailbox, mailbox, Signal, send, message)
import Task             exposing (Task, sleep, andThen)
import Models           exposing (Model, Entry, allEntries)

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

