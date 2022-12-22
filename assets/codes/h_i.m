function h = findH(x, y)
  # h_i = x_i+1 - x_i
  x = x(:); # transpose both x and y
  y = y(:);
  h = x(2:end) - x(1:end-1);
