dividesTo :: Int -> Int -> Bool
dividesTo x y = mod y x == 0

nextDiv :: Int -> Int -> Int
nextDiv _ 0 = 0
nextDiv x y = if dividesTo (x+1) y
			  then (x+1)
			  else nextDiv (x+1) y


sumDivs :: Int -> Int
sumDivs x = sumaDivisores x 0

sumaDivisores :: Int -> Int -> Int
sumaDivisores x y = if x == y 
					then 0
					else (nextDiv y x) + sumaDivisores x (nextDiv y x)

power :: Int -> Int -> Int
power x 0 = 1
power x y = x * (power x (y-1))

dividesTo' :: Int -> Int -> Bool
dividesTo' x 0 = True
dividesTo' x y = if x <= y 
				 then dividesTo' x (y - x)
				 else False

prime :: Int -> Bool
prime 0 = False
prime 1 = False
prime x = nextDiv 1 x == x

phi :: Int -> Int
phi x = phi' x 2

phi' :: Int -> Int -> Int
phi' 1 y = (y-1)
phi' x y = if prime y
		   then phi' (x-1) (y+1)
		   else phi' x (y+1)

{-

flip :: (a -> b -> c) -> b -> a -> c
flip f y x = f x y  

curry :: ((a,b) -> c) -> a -> b -> c
curry f x y = f (x,y)

swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

(.) :: (a -> b) -> (c -> a) -> c -> b
(.) f g x = f (g x)

siendo f :: (a,b) -> c

flip (curry f) = curry (f . swap) // curry.1

flip f' = curry (f . swap) // flip.1
						   //siendo f' :: a -> b -> c

f'' = curry (f . swap)  // (.).1
						// siendo f'' :: b -> a -> c

f'' = curry g // curry.1
			  // siendo g :: (b,a) -> c

f'' = g' // siendo g' :: b -> a -> c

Verdadero

-}

len (xs ++ ys) = len xs + len ys

