buildMatrix :: (RealFloat a) => [[a]] -> Matrix a
buildMatrix []   = emptyMatrix
buildMatrix [[]] = emptyMatrix

reprOneNorm :: (RealFloat a) => [a] -> a
reprOneNorm a = sqrt $ reprOneDot a a

reprIdentity :: (RealFloat a) => Int -> [[a]]
reprIdentity n = map mkRow (take n [0..])
  where
    zeroSource = repeat 0
    mkRow i    = (take i zeroSource) ++ [1] ++ (take (n-i-1) zeroSource)

reprOneSecondMomentProduct :: (RealFloat a) => [a] -> [[a]]
reprOneSecondMomentProduct a = map (\v -> reprOneScale a v) a

reprScale :: (RealFloat a) => [[a]] -> a -> [[a]]
reprScale a b = map (\row -> reprOneScale row b) a

-- compute householder matrix H of b and k (k is indexed by 0)
householder :: (RealFloat a) => Vector a -> Int -> Matrix a
householder b k = buildMatrix hrepr
  where
    n     = size b
    dlen  = n - k -- k is indexed by 0
    w     = (take (n-dlen) $ repeat 0) ++ (assert (length v == length d) v)
    d     = drop (k) $ vals b
    alpha = -1 * (sgn (head d)) * (reprOneNorm d)
    v0    = sqrt (0.5 * (1 - ((head d)/alpha)))
    p     = -1 * alpha * v0
    v     = v0 : (map (/(2*p)) $ tail d)
    hrepr = reprIdentity n `reprMinus` (reprScale (reprOneSecondMomentProduct w) 2)
