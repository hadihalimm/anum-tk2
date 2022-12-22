function S = evaluateNaturalCubic(x, B, C, D)
  # B, C, D merupakan koefisien-koefisien S_i
  # Take x_val from x_1 up to x_i-1
  p = x(1):resolution:x(length(x)-1);
  
  # Evaluate spline at requested x_val
  S = zeros(1, length(p));
  for i = 1:length(p)
    # Find interval j that contains p
    j = 1;
    while j+1 < length(x+1) && x(j+1) < p(i)
      j = j + 1;
    endwhile

    # Evaluate cubic spline S_j at point p
    # S_i = a_i + b_i (x-x_i) + c_i (x-x_i)^2 + d_i (x-x_i)^3
    S(i) = y(j) + B(j) * (p(i) - x(j)) + C(j) * (p(i) - x(j))^2 + D(j) * (p(i) - x(j))^3;
  endfor
