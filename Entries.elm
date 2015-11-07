module Entries where

import Log exposing (Entry)
import Date exposing (fromTime)

allEntries = 
  [ { hash = "a5aa5f3ca56a685b2c346dc96f31146da72cc6e8"
    , user = "Canada"
    , description = "Voted in the National Election"
    , date = fromTime 1445292000000
    }
  , { hash = "140c83ff510c1c5abe7be1d25944450b82ed371e"
    , user = "Justin Trudeau"
    , description = "Swearing in as Canada's 23rd Prime Minister"
    , date = fromTime 1446564600000
    }
  ]

