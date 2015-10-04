# Awesome algorithms

A collection of elegant algorithms in various languages (ruby, python, haskell)

## Metropolis

A haskell implementation of the metropolis algorithm aka Monte Carlo method

## Fast Fourier Transform

An implementation of the Discrete Fourier Transform.

## Fast Multipole algorithm

A python implemention of the Fast Multipole algorithm

## QR Algorithm

Input:
```
toCompute = np.array([[12, -51,   4],[ 6, 167, -68],[-4,  24, -41],])
```

Compute:
```
eigenvalue, eigenvector = qr(toCompute, 100)
```

Output:
```
print eigenvalue
print eigenvector
```

Compare with Numpy
```
w, v = np.linalg.eig(toCompute)
print w
rint v
```

## Householder

A python implementation of the Householder reflection approach for matrix computations

Input:
```
a = np.array([
    [4, 1, -2, 2],
    [1, 2, 0, 1],
    [-2, 0, 3, -2],
    [2, 1, -2, -1]
])
c = np.array([
    [-1., 0., -1.],
    [-1.23367806, 0.25907239, -1.],
    [-0.71892373, -0.23724483, -1.],
    [-1.87761058, 1.18289466, -1.],
    [-0.85812972, -0.13129385, -1.],
    [-1.42048733, 0.49859105, -1.],
    [-0.38289289, -0.36757717, -1.]])
```

Output:
```
q, r = qr_fact_householder(a)
aa, bb = qr(a)
print np.dot(aa, bb)
print np.dot(q, r)
```


## Quicksort

recursive sorting with high-speed high space complexity approach

# REF
* https://projecteuler.net/
* http://www.stoimen.com/blog/
* https://www.codingame.com/
* http://www.learnalgorithms.in/
* https://github.com/kanwei/algorithms/tree/master/lib/algorithms
* https://github.com/sagivo/algorithms
