data Alpha = T | O | D | L
   deriving (Eq)

data State = Qs | Qf | Q1 | Q2 | Q3 |
             Q4 | Q5 | Q6
   deriving (Eq)

trans :: Alpha -> State -> State
trans a s
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
