import numpy as np

#used for testing
from numpy.linalg import qr

from helpers import norm, embed_matrix

def householder_reflection(col):
    n_height = len(col)
    m_matrix = np.eye(n_height, 1)
    I = np.eye(n_height)
    v = np.array([x + y for x, y in zip(col, norm(col) * m_matrix)])
    u = v / norm(v)
    return I - 2 * u * u.T

def qr_fact_householder(matrixA):
    rows, cols = matrixA.shape
    first_col_H = matrixA.T[0]
    H = householder_reflection(first_col_H)
    Q = H

    for i in range(cols):
        resultant_matrix = np.dot(Q, matrixA).T
        col = resultant_matrix[i, i:]
        minor = householder_reflection(col)
        I = np.eye(rows)
        H = embed_matrix(I, minor)
        Q = np.dot(H, Q)

    R = np.dot(Q, matrixA)
    return Q.T, R
