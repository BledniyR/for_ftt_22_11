function H = hamilt(B,t,P)
    [R,m]=size(B);
    H=zeros(R);
    psi=B;
    nmax_=nmax(B);
    for q=1:R
        for j=1:m-1 
            %aj^+*aj+1 |psi(q)>
            if psi(q,j)<nmax_ & psi(q,j+1)>0
                psi_1=psi(q,:);
                psi_1(j+1)=psi_1(j+1)-1;
                psi_1(j)=psi_1(j)+1;
                psi_soot=search_str(B,psi_1);
                c=sqrt(psi(q,j)+1)*sqrt(psi(q,j+1));
                H(q,psi_soot)=-t*c;
            end
            %aj*aj+1^+ |psi(q)>
            if psi(q,j+1)<nmax_ & psi(q,j)>0
                psi_2=psi(q,:);
                psi_2(j+1)=psi_2(j+1)+1;
                psi_2(j)=psi_2(j)-1;
                psi_soot=search_str(B,psi_2);
                c=sqrt(psi(q,j+1)+1)*sqrt(psi(q,j));
                H(q,psi_soot)=-t*c;
            end
            
        end
            %a1^+*am|psi(q)>
            if psi(q,1)<nmax_ & psi(q,m)>0
                psi_3=psi(q,:);
                psi_3(1)=psi_3(1)+1;
                psi_3(m)=psi_3(m)-1;
                psi_soot=search_str(B,psi_3);
                c=sqrt(psi(q,1)+1)*sqrt(psi(q,m));
                if P==1
                    H(q,psi_soot)=-t*c*(-1)^(sum(psi(1,:))-1);
                else
                    H(q,psi_soot)=-t*c;
                end
            end
            %a1*am^+|psi(q)
            if psi(q,m)<nmax_ & psi(q,1)>0
                psi_4=psi(q,:);
                psi_4(m)=psi_4(m)+1;
                psi_4(1)=psi_4(1)-1;
                psi_soot=search_str(B,psi_4);
                c=sqrt(psi(q,m)+1)*sqrt(psi(q,1));
                if P==1
                    H(q,psi_soot)=-t*c*(-1)^(sum(psi(1,:))-1);
                else
                    H(q,psi_soot)=-t*c;
                end
            end
            
    end
    [V,E]=eig(H);
    E=diag(E);
    % plot (sort(E),"o")
    % n=0:m-1;
    % k=2*pi*n/m;
    % Ek=-2*t*cos(k);
    % hold on
    % plot(sort(Ek),"+")