data Nota = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord)

type Tiempo = Int -- el instante en el que suena una nota

type Duracion = Int -- cantidad de tiempos que suena una nota




type Midi = [[Nota]] -- notas simult ́aneas para cada tiempo en la duraci ́on de la melod ́ıa

type Sampler = Tiempo -> [Nota] -- funci ́on que da las notas que suenan en un tiempo

{- a) alargar :: Int -> Comp -> Comp

que retorna una composici ́on donde la duraci ́on cada nota est ́a multiplicada por un factor con respecto a la duración -}

alargar :: Int -> Comp -> Comp
alargar n (Silencio m) = Silencio (m*n)
alargar n (Batido nota m) = Batido nota (n*m)
alargar n (Arpegio c1 c2) = Arpegio (alargar n c1) (alargar n c2)
alargar n (Acorde c1 c2) = Acorde (alargar n c1) (alargar n c2)

{- b) duracion :: Comp -> Int

que retorna la duración total de la melodía compuesta (considerando que los acordes terminan cuando terminael más largo). -}

duracion :: Comp -> Int
duracion (Silencio m) = m
duracion (Batido nota m) = m
duracion (Arpegio c1 c2) = (duracion c1) + (duracion c2)
duracion (Acorde c1 c2) = max (duracion c1) (duracion c2)

{-
c) sintetizar :: Comp -> Midi

que retorna una lista con un elemento por cada tiempo de la duracion de la melodıa compuesta. Cada elemento

de dicha lista es una lista con las notas que suenan simultaneamente en el tiempo indicado (un elemento vacıo

indica silencio). -}

sintetizar :: Comp -> Midi
sintetizar (Silencio n) = [[]]
sintetizar (Batido nota m) = [[nota]]
sintetizar (Arpegio c1 c2) = sintetizar c1 ++ sintetizar c2
sintetizar (Acorde c1 c2) = ... (sintetizar c1) ... (sintetizar c2) ...

{-Indique el tipo y de una implementaci ́on de una funci ́on que generalice la recursi ́on

(foldComp) y escriba las funciones del putno 1 utilizando esta funci ́on (sin utilizar recursi ́on expl ́ıcita).-}

data Comp = Silencio Duracion | Batido Nota Duracion |
								Arpegio Comp Comp | -- composiciones en secuencia
								Acorde Comp Comp -- composiciones en paralelo

foldComp :: (Duracion -> b) -> (Nota -> Duracion -> b) -> (b -> b -> b) -> (b -> b -> b) -> Comp -> b
foldComp fs fb far fac (Silencio n) = fs n
foldComp fs fb far fac (Batido nota m) = fb nota m
foldComp fs fb far fac (Arpegio c1 c2) = far (foldComp fs fb far fac c1) (foldComp fs fb far fac c2)
foldComp fs fb far fac (Acorde c1 c2) = fac (foldComp fs fb far fac c1) (foldComp fs fb far fac c2)

a)  

silencios = foldComp (flip (:) []) (\_ _ -> []) (++) 


[(1, []) (2, [[Do, Mi, Re]]), (3, [])]

[(1,[]), (3,[])]

[1,3]