function A = buildA(t)
  # A part of tridiagonal linear system Ax=b
  
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
