module Models where

import Date exposing (Date, fromTime)

type alias Model = List Entry

type alias Entry =
  { user : String
  , description : String
  , date : Date
  , hash : String
  }

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

