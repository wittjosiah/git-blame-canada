import Html     exposing (Html)
import Router   exposing (Route, match, (:->))
import History  exposing (path, length, hash)
import Task     exposing (Task)
import Views    exposing (displayEntries, displayAbout, pathChangeMailbox)

route : Route (String -> Int -> Html)
route = match
  [ "/"   :-> displayEntries
  , "/about"     :-> displayAbout
  ] displayEntries

port runTask : Signal (Task error ())
port runTask =
    pathChangeMailbox.signal

main = Signal.map3 route path hash length

