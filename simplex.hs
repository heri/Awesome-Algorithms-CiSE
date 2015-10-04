
import Problem
import Data.Array
import Control.Monad
import Control.Monad.State
import Data.List


toOrdering True = LT
toOrdering False = GT


simplexStandard :: (Ord a, Fractional a) => State (Problem a) SolType
simplexStandard =  do
  c <- getC
  a <- getA
  b <- getB
  (_,(m,n)) <- getDim

-- Get the index with the highest reduced costd
  let (maxC,indexC) = head $ sortBy (f (>=)) (zip (elems c) [1..n])

  -- if index is negative, we found optimal solution
  if maxC <= 0 then return Optimum

  -- otherwise we get the list of variables that will be taken out
    else do let candidates = sortBy (f (<=)) [((b ! line) / (a ! (line,indexC)), line) | line <-[1..m], (a ! (line,indexC) ) > 0]

            --No solutions
            if null candidates then return Aucune
              else let (val, indiceL) = head candidates
                       pivot = a ! (indiceL, indexC) in

            -- Otherwise get position and value of pivot
                    do setA $ spread (indiceL, indexC) pivot a
                       setC $ listArray (bounds c) [ci | i <- [1..n], let ci = (c ! i) - ((c ! indexC)/pivot * (a ! (indiceL,i)))]
                       setB $ updateB (indiceL, indexC) pivot b a

            -- iterate
                       simplexStandard

 where f g (a,b) (a',b') = toOrdering (g a a')
       updateB (pI,pJ) piv tab ct = tab // [(i,val) | i <- [n1..n],
                                                       let val = if i == pI then (tab ! i) / piv
                                                                    else (tab ! i) - (ct ! (i,pJ))/piv * (tab ! pI) ]
             where (n1,n) = bounds tab

       spread (pI,pJ) piv tab = tab // [((i,j),val) | i <- [n1..n2],
                                                              let li = recoverLine i tab
                                                                  pivline = tab ! (i,pJ)
                                                                  li' = if (i == pI) then map (/piv) li
                                                                         else zipWith (\x pi -> x - pivline/piv*pi) li lpiv,
                                                              (j,val) <- zip [p1..p2] li']
              where ((n1,p1),(n2,p2)) = bounds tab
                    lpiv =  (recoverLine pI tab)

{- Get back values of bsae variables -}
extractValues :: (Fractional a) => State (Problem a) [(Integer,a)]
extractValues = do c <- getC
                     a <- getA
                     b <- getB
                     (_,(m,n)) <- getDim
                     return [(var,val) | var <- range (1,n),
                                        (c ! var) ==  0,
                                        let val =  head [bi | i <- [1..m],
                                                              a ! (i,var) == 1,
                                                              let bi = b ! i]]



{- Max z = x1 + x2
    sc 2x1 + x2 + x3 = 14
       -x1 + 2x2 + x4 = 8
       2x1 - x2 + x5 = 10 -}


c1 :: Constraint Double
c1 = Constraint [2, 1] LT 14
c2 :: Constraint Double
c2 = Constraint [1, -2] GT (-8)
c3 :: Constraint Double
c3 = Constraint [2, -1] LT 10

test = mkProblem [1,1] [c1,c2,c3]
