--5) 

--a)
-- \f x-> f (f x)

--b)
-- \f x y -> f y x

--C)
-- \x -> x+1

--6)

--a)
fix :: (a -> a) -> a
fix f = f (fix f)

summ :: [Int] -> Int 
summ = fix (\r xs -> if  null xs then 0 else (head xs) + r (tail xs ))

--b)
fork :: (a -> b, a -> c) -> a -> (b,c) 
fork (f,g) x = (f x, g x)

--c)
apply :: (a -> b) -> a -> b
apply f = f


apply2 :: (a -> b) -> a -> b
apply2 = id 

--d)

curry :: ((a,b) -> c) -> a -> b -> c
curry f x y = f (x,y)