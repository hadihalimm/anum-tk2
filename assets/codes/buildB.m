function b = buildB(t)
  # b part of tridiagonal linear system Ax=b
  b = 3 * (t(2:end) - t(1:end-1));
  b = [0; b; 0]; # append prepend 0 for natural qubic spline
