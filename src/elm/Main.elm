import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, href)
import Signal exposing (Address)
import Date exposing (Date, fromTime)
import Date.Format exposing (format)
import String exposing (append)
import Router exposing (Route, match, (:->))
import History exposing (setPath, path, back, forward, length, hash)
import Signal exposing (Mailbox, mailbox, Signal, send, message)
import Task exposing (Task, sleep, andThen)
import Log exposing (displayEntries, displayAbout, pathChangeMailbox)

route : Route (String -> Int -> Html)
route = match
  [ "/"   :-> displayEntries
  , "/about"     :-> displayAbout
  ] displayEntries

port runTask : Signal (Task error ())
port runTask =
    pathChangeMailbox.signal

main = Signal.map3 route path hash length
