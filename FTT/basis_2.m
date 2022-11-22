function [B] = basis2(m,N)
    R = factorial(N+m-1)/(factorial(N) * factorial(m-1));
    B = zeros(R,m);
    B(1,1) = N;
    for i = 2:R
        B(i,:) = B(i-1,:);
        j = 1;
        if B(i,j) ~= 0
            B(i,j) = B(i,j) - 1;
            B(i,j+1) = B(i,j+1) + 1;
        else
            while j<(m-1) & B(i,j) == 0
                j = j + 1;
            end
            B(i,j+1) = B(i,j+1) + 1;
            B(i,j) = B(i,j) - 1;
            B(i,1) = B(i,j);
            B(i,j) = 0;
        end
        
    end
    
    end