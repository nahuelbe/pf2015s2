-- 1. De ser posible, dar 2 ejemplos de expresiones que tengan cada uno de los siguientes tipos
-- a) Bool = True False
-- b) (Int, Int) = (1,1) (2,2)
-- c) Char -> Int = digitToInt ord
-- d) (Int, Char) -> Bool = 

-- 4. Dar los tipos de las siguientes funciones

--a)
first :: (a,b) -> a
first (x,y) = x

--b)
second :: (a,b) -> b
second (x,y) = y

--c)
const :: a -> b -> a
const x y = x

--d)
compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g = (\x -> f(g x))

--e)
apply :: (a -> b) -> a -> b
apply f x = f x

--f)
subst :: (a -> b -> c) -> (a -> b) -> a -> c
subst f g x = f x (g x)

--g)
pairFunc :: ((b -> a), (a -> b)) -> a -> b -> (a,b)
pairFunc (f1,f2) x y = (f1 (f2 x), f2 (f1 y))

--11)
--a)
\x y z -> if x <= y && x <= z
		  then x
		  else if y <= x && y <= z
			   then y
			   else z

--b)
\x -> \x -> x

--c)
\x -> \y -> case x of True -> y
				      False -> False
--12)
--a) 
iff :: Bool -> (Bool -> Bool)
iff x y = if x 
		  then not y
		  else y

--b)
alpha :: a -> a -> a
alpha x y = y