function [C, B, D] = secondDerivativeCoeff(A, b, t)
  # Solve for the second derivative at each data point
  # Solve coefficient C
  C = A \ b;

  # Solve coefficient B
  B = t - (h .* (2 * C(1:end-1) + C(2:end))) / 3;

  # Solve coefficient D
  D = (C(2:end) - C(1:end-1)) ./ (3 * h);
