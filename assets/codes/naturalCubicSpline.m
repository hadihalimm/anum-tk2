function S = naturalCubicSpline(x, y, resolution=0.05)
  # Example call naturalCubicSpline(x,y,1)

  nx = length(x);
  ny = length(y);

  if nx != ny
    error("x length and y length doesn't match");
  endif

  if nx < 2
    error("Need n >= 2 points");
  endif

  # h_i = x_i+1 - x_i
  x = x(:);
  y = y(:);
  h = x(2:end) - x(1:end-1);

  # delta_i = y_i+1 - y_i
  d_i = y(2:end) - y(1:end-1);

  # delta_i / h
  t = d_i ./ h; # element-by-element right division

  # b part of tridiagonal linear system Ax=b
  b = 3 * (t(2:end) - t(1:end-1));
  b = [0; b; 0]; # append prepend 0 for natural qubic spline

  # Create Matrix A
  A = zeros(length(b), length(b));

  # Masukkan 1 ke kedua ujung
  A(1, 1) = 1;
  A(length(b), length(b)) = 1;

  # Fill in tridiagonal matrix A
  for i = 2:length(h)
    al = h(i-1);
    ac = 2*(h(i-1) + h(i));
    ar = h(i);

    A(i, i - 1) = al;
    A(i, i) = ac;
    A(i, i + 1) = ar;
  endfor

  # Solve for the second derivative at each data point
  # Solve coefficient C
  C = A \ b;

  # Solve coefficient B
  B = t - (h .* (2 * C(1:end-1) + C(2:end))) / 3;

  # Solve coefficient D
  D = (C(2:end) - C(1:end-1)) ./ (3 * h);

  # Take x_val from x_1 up to x_i-1
  p = x(1):resolution:x(nx-1);
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

endfunction
