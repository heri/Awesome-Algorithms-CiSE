# Awesome algorithms

A collection of elegant algorithms in various languages (ruby, python, haskell)

## Criterias

* beautiful
* timeless
* human-readable
* works & efficient

## Quicksort

[Recursive sorting](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/quicksort.rb) with high-speed high space complexity approach. It's the posterchild of computer science algorithms!

Original author: Tony Hoare of Elliott Brothers, Ltd., London

## Fast Fourier Transform

An [implementation of the Discrete Fourier Transform](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/fft.rb).  The FFT is an extremely important and widely-used method of extracting useful information from sampled signals.

Original authors: James Cooley of the IBM T.J. Watson Research Center and John Tukey of Princeton
University and AT&T Bell Laboratories

## Dijkstra

[Dijkstra's algorithm](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/dijkstra.py) determines the length from start to every other vertex in the graph.

The algorithm exist in every router in the world, for identifying the best route between two nodes in a network.


## Minimax

[Minimax](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/minimax.rb) can be used to model games. The algorithm will find the best move recursively, knowing the rules and the environmen (aka board). Popular media will call the computer "intelligent" however it is just a matter of the algorithm computing enough moves ahead the human player. No machine learning, no deep learning, no random moves or approximation. Juste brute force.

By extension, minimax could model video games, trading, and more if the rules are set, followed by the players and the environment is set.

## LZW

[LZW Data compression algorith](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/lzw.py) - a must

## Map Reduce

[MapReduce](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/mapreduce_machine_learning.py) processes large datasets in a distributed manner. Map sorts data in different batches according to a criteria, while reduce will perform an operation in each batch.

MapReduce implemented in python with use case of machine learning

Input

`Json data`

## Metropolis

[A haskell implementation](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/Metropolis.hs) of the metropolis algorithm aka Monte Carlo method

Original authors: John von Neumann, Stan Ulam, and Nick Metropolis, of the Los Alamos Scientific Laboratory

## QR Algorithm

[A python implemention](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/qr.py) of the QR algorithm. It turns once-formidable [eigenvalue problems](http://planetmath.org/eigenvalueproblem) into routine calculations.

Original author: J.G.F. Francis of Ferranti Ltd., London

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

A [python implementation of the Householder reflection](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/householder.py) approach for matrix computations

Original author: Alston Householder of Oak Ridge National Laboratory

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
Compute:
```
q, r = qr_fact_householder(a)
```

Output:
```
aa, bb = qr(a)
print np.dot(aa, bb)
print np.dot(q, r)
```

## Simplex

[Simplex algorithm](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/simplex.hs) for linear optimization. Supposing problems (economics, business, industry) can be linearized, the Simplex algorithm is an efficient algorithm to find the optimal solution within constrains.

tldr; maximize c.x with constraint A.x = b

Original author: George Dantzig, at the RAND Corporation

## Fast Multipole Algorithm

[The Fast Multipole method](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/multipole.py) reduces the complexity of matrix-vector multiplication involving a certain type of dense matrix which can arise out of many physical systems.

Original author: Leslie Greengard and Vladimir Rokhlin of Yale University

## p5 Tweets : graphics in 140 chars

Graphics in 140 characters (view [p5tweets](http://funprogramming.org/p5tweets/) )

```
int i,w=900;void setup(){size(w,w);}void draw(){fill(0,4);stroke(255,87);bezier(++i%w,w-(i%w),i/.23%w,i*7%w,i/.17%w,i/.3%w,i*6%w,w/2);}
```

Output:

![p5](http://funprogramming.org/p5tweets/large/32.jpg)

### superCollider : sound in 140 characters

By Nathaniel Virgo with [Supercollider](https://github.com/supercollider/supercollider)

```
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}.play/
```

## Sleep Sort

An [elegant, if expensive, algorithm](https://github.com/heri/Awesome-Algorithms-CiSE/blob/master/sleepsort.py) to sort a series of number. Will print the n number after n seconds

Original source: anonymous on 4chan


# References

* http://www.stoimen.com/blog/
* http://www.learnalgorithms.in/
* https://projecteuler.net/
* https://www.codingame.com/
* https://github.com/kanwei/algorithms/tree/master/lib/algorithms
* https://github.com/sagivo/algorithms


# Contact

Heri

* [Code on Github](http://github.com/heri)
* [I write on Medium](http://medium.com/@heri)
* [twitter](http://twitter.com/heri)
* Photography [Instagram](https://instagram.com/heri_rakotomalala/) [500px](https://500px.com/heri)
* [Background site](http://madmedia.ca)
