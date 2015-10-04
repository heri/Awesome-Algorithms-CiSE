-- | Radix-2 decimation-in-time fast Fourier transform.
fft :: U.Vector CD -> U.Vector CD
fft v | vectorOK v  = G.create $ do mv <- G.thaw v
                                    mfft mv
                                    return mv
      | otherwise   = error "fft: bad vector length"

-- Vector length must be power of two. It's not checked
mfft :: (M.MVector v CD) => v s CD -> ST s ()
mfft vec = bitReverse 0 0
 where
  bitReverse i j | i == len-1 = stage 0 1
                 | otherwise  = do
    when (i < j) $ M.swap vec i j
    let inner k l | k <= l    = inner (k `shiftR` 1) (l-k)
                  | otherwise = bitReverse (i+1) (l+k)
    inner (len `shiftR` 1) j
  stage l !l1 | l == m    = return ()
              | otherwise = do
    let !l2 = l1 `shiftL` 1
        !e  = -6.283185307179586/fromIntegral l2
        flight j !a | j == l1   = stage (l+1) l2
                    | otherwise = do
          let butterfly i | i >= len  = flight (j+1) (a+e)
                          | otherwise = do
                let i1 = i + l1
                xi1 :+ yi1 <- M.read vec i1
                let !c = cos a
                    !s = sin a
                    d  = (c*xi1 - s*yi1) :+ (s*xi1 + c*yi1)
                ci <- M.read vec i
                M.write vec i1 (ci - d)
                M.write vec i (ci + d)
                butterfly (i+l2)
          butterfly j
    flight 0 0
  len = M.length vec
  m   = log2 len
