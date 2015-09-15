--1.

seven :: Int -> Int
seven x = 7

sign :: Int -> Int
sign x = if x == 0 
		 then 0 
		 else if x > 0
		 	  then 1
		 	  else -1

sign' :: Int -> Int
sign' x | x == 0 = 0
		| x > 0 = 1
		| otherwise = -1

absolute :: Int -> Int
absolute x = sign x * x

and' :: Bool -> Bool -> Bool
and' False _ = False
and' _ y = y

or' :: Bool -> Bool -> Bool
or' True _ = True
or' _ y = y

not' :: Bool -> Bool
not' True = False
not' _ = True

xor' :: Bool -> Bool -> Bool
xor' True True = True
xor' False False = True
xor' _ _ = False

dividesTo :: Int -> Int -> Bool
dividesTo x y = mod y x == 0

isMultiple :: Int -> Int -> Bool
isMultiple x y = dividesTo y x

isCommonDivisor :: Int -> (Int,Int) -> Bool
isCommonDivisor x (y,z) = dividesTo x y && dividesTo x z

isCommonMult :: Int -> (Int,Int) -> Bool
isCommonMult x (y,z) = isMultiple x y && isMultiple x z

swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)
