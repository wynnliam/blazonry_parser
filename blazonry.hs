data Alpha = T | O | D | L | None
   deriving (Eq)

-- How we implement Show for Alpha.
-- Enalbes printing of Alpha types
instance Show Alpha where
   show T = "T"
   show O = "O"
   show D = "D"
   show L = "L"
   show None = "None"

data State = Qs | Qf | Q1 | Q2 | Q3 |
             Q4 | Q5 | Q6
   deriving (Eq)

trans :: Alpha -> State -> State
trans a s
    | a == None = Qf
    | s == Qs && a == T = Q1
    | s == Qs && a == D = Q4
    | s == Q1 && a == O = Q2
    | s == Q4 && a == L = Q6
    | s == Q4 && a == T = Q5
    | s == Q6 && a == T = Q5
    | s == Q5 && a == T = Q1
    | s == Q2 && a == T = Q3
    | otherwise         = Qf

verify :: [Alpha] -> State -> Bool
verify [] s
    | s == Q1 || s == Q3 = True
    | otherwise          = False
verify (x:xs) s = verify xs (trans x s)

non_terminal :: String -> Alpha
non_terminal s
    -- TINCTURES
    -- Metals
    | s == "Or"       = T
    | s == "Argent"   = T
    -- Colors
    | s == "Azure"    = T
    | s == "Gules"    = T
    | s == "Purpure"  = T
    | s == "Sable"    = T
    | s == "Vert"     = T
    -- Furs
    | s == "Ermine"   = T
    | s == "Ermines"  = T
    | s == "Erminois" = T
    | s == "Pean"     = T
    -- ORDINARIES
    | s == "Cross"   = O
    | s == "Pale"    = O
    | s == "Fess"    = O
    | s == "Bend"    = O
    | s == "Chevron" = O
    | s == "Saltire" = O
    | s == "Chief"   = O
    -- DIVISIONS
    | s == "In Fess"           = D
    | s == "In Pale"           = D
    | s == "In Bend"           = D
    | s == "In Bend-Sinister"  = D
    | s == "In Saltire"        = D
    | s == "In Chevron"        = D
    | s == "In Chausse"        = D
    | s == "In Checky"         = D
    | s == "In Barry"          = D
    | s == "In Bendy"          = D
    | s == "In Bendy-Sinister" = D
    | s == "In Paly"           = D
    | s == "In Pily"           = D
    | s == "In Chevronny"      = D
    -- LINES
    | s == "Invected"              = L
    | s == "Engrailed"             = L
    | s == "Embattled"             = L
    | s == "Wavy"                  = L
    | s == "Nebuly"                = L
    | s == "Fir-Tree Topped"       = L
    | s == "Fir-Twigged"           = L
    | s == "Indented"              = L
    | s == "Dancetty"              = L
    | s == "Enarched"              = L
    | s == "Trefly-Counter-Trefly" = L
    | s == "Embattled-Cross"       = L
    | s == "Potenty"               = L
    | s == "Casketty"              = L
    | s == "Diamondy"              = L
    | s == "Embattled-Pike"        = L
    | s == "Dancetty-Floretty"     = L
    | s == "Indented Pommetty"     = L
    | s == "Rayonny"               = L
    | s == "Embattled-Grady"       = L
    | s == "Dovetailed"            = L
    | s == "Bevilled"              = L
    | s == "Thorny"                = L
    | s == "Raguly"                = L
    | s == "Urdy"                  = L
    | s == "Angled"                = L
    | s == "Dovetailed-Indented"   = L
    -- Not applicable
    | otherwise      = None

non_terminalize :: [[Char]] -> [Alpha]
non_terminalize [] = []
non_terminalize [a] = [non_terminal a]
non_terminalize (x:xs) = [non_terminal x] ++ non_terminalize xs

verify_strings :: [[Char]] -> Bool
verify_strings s = verify (non_terminalize s) Qs
