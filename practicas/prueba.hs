suma :: Int -> Int -> Int
suma = (+)

sumaPar :: (Int, Int) -> Int
sumaPar (x,y) = x + y

curry' :: ((a,b) -> c) -> a -> b -> c
curry' f x y = f (x,y)

uncurry' :: (a -> b -> c) -> (a,b) -> c
uncurry' f (x,y) = f x y

compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g = \x -> f (g x)

twice :: (a -> a) -> (a -> a)
twice f = f.f

doble :: Int -> Int
doble x = 2 * x

cuadruple :: Int -> Int
cuadruple = twice doble

apply :: (a -> b) -> a -> b
apply f = f 

subst :: (a -> b -> c) -> (a -> b) -> a -> c
subst f g x = f x (g x)

pairFunc :: ((b -> a),(a -> b)) -> a -> b -> (a,b)
pairFunc (f1, f2) x y = (f1 (f2 x), f2 (f1 y))