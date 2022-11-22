function [X] = basis3(m,N,n_max)
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
    i_ =[];
    for i = 1:R
        X = B(i,:);
        X = X(X>n_max);
        x = size(X);
        if x(2) == 0
            i_ = [i_,i];
        end
    end
    X = [];
    for i = i_
        X = [X;B(i,:)];
    end
    
    end