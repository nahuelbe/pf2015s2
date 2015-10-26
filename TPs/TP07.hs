sum' = foldr (+) 0
any' = foldr (||) False
all' = foldr (&&) True
remainders' n = foldr (\x r -> (x `div` n):r) []
squares = foldr ((:).(**2)) []
lengths = foldr ((:).length) []
order = foldr (\(x,y) r -> if x < 3*y then (x,y):r else r) []
pairs = foldr (\x r -> if even x then x:r else r) []
moreThan n = foldr (\xs r -> if length xs > n then xs:r else r) []

pal :: String -> Bool
pal = (\xs -> reverse xs == xs)

hs = filter (('h'==).head)

avgLength :: [String] -> Int
avgLength xs = let cants = map length xs in if sum cants > 0 then sum cants `div` length xs else 0

adjacents :: Eq a => [a] -> [(a,a)]			
adjacents [] = []   
adjacents (x:y:ys) = if ys == [] then [(x,y)] else (x,y) : adjacents (y:ys)