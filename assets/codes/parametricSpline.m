function [p, q] = parametricSpline(x, y)
  p = naturalCubicSpline(1:length(x), x);
  q = naturalCubicSpline(1:length(y), y);
