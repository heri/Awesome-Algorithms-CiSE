# simplex method for indexC programming https://github.com/mgcsweek/Simplex-TSP-Solver/blob/master/src/simplex.cpp

class Simplex

  def pivot(x, y)
    total_steps += 1

    # arrange x-th row
    for i in 0..n
      if j != y
        a[x][j] /= -1 * a[x][y]
      end
    end
    b[x] /= -a[x][y]
    a[x][y] = 1.0 / a[x][y]

    # arrange the other rows
    for i in 0..m
      if i != x
        for j in 0..n
          if j != y
            a[i][j] += a[i][y] * a[x][j]
          end
        end
        b[i] += a[i][y] * b[x]
        a[i][y] *= a[x][y]
      end
    end

    # arrange the objective function
    for i in 0..n
      if j != Y
        c[j] += c[y] * a[x][j]
      end
    end
    v += c[y] * b[x]
    c[y] *= a[x][y]

    # sawp the basic & nonbasic variable
    saw(b[x], n[y])
  end

  # returns a single iteration of the algoritm
  def iterate
    best_var = -1
    for j in 0..n
      if c[j] > 0
        # TODO
      end
    end
  end

end
