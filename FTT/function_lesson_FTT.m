function H = hamit(B,t, P)
[R, m] = size(B);
H = zeros(R);
psi = B;
nmax_ = nmax(B);
for q=1:R
    for j = 1:m-1
        if prsi(q,j)<nmax_ & psi(q, j+1)