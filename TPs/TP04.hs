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
