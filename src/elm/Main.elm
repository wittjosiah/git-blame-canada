import Log exposing (view, update)
import Entries exposing (allEntries)
import StartApp.Simple exposing (start)

main =
  start
    { model = allEntries
    , update = update
    , view = view
    }

