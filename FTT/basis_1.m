function [B] = basis1(m,n_max)
    R = (n_max+1)^m;
    B = zeros(R,m);
    for i = 2:R
        t = 1;
        B(i,:) = B(i-1,:);
            if B(i,t) < n_max
                B(i,t) = B(i,t) + 1;
            else
                while t < m & (B(i,t) == n_max)  
                    B(i,t) = 0;
                    t = t+1;
                end
                B(i,t) = B(i,t) + 1;
    
            end    
       
    end
    end