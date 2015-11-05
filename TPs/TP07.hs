{-sum, suma los elementos de una lista de n´umeros.
any, devuelve True si alg´un elemento de una lista es True.
all, devuelve True si todos los elementos de una lista son True.
codes, dada una lista de caracteres, devuelve la lista de sus c´odigos.
remainders, dada una lista de n´umeros, devuelve los restos de su divisi´on por un n´umero.
squares, dada una lista de n´umeros, devuelve la lista de sus cuadrados.
lengths, dada una lista de listas, devuelve la lista de sus longitudes.
order, dada una lista de pares ordenados de n´umeros, devuelve la lista de aquellos
cuya primer componente es menor que el triple de la segunda.
pairs, dada una lista de n´umeros, devuelve la lista con aquellos que son pares.
chars, dada una lista de caracteres, devuelve la lista de los que son letras.
moreThan, dada una lista de listas xss y un n´umero n, devuelve la lista de aquellas
listas de xss que tienen longitud mayor que n.
P´ -}

sum' = foldr (+) 0
any' = foldr (||) False
all' = foldr (&&) True
remainders' n = foldr (\x -> (:) (x `div` n) ) []
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

{-diffAdj :: [Int] -> [Int]
diffAdj xs -}
