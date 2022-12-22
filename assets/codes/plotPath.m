function parametricSpline(x, y)
  p = naturalCubicSpline(1:length(x), x);
  q = naturalCubicSpline(1:length(y), y);
  plot(x, y, 'o', p, q)
