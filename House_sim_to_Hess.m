function B=House_sim_to_Hess(A)
[n,nn]=size(A);
for k=1:n-2
    x=A(:,k);
    x(1:k)=0;
    p=sign(x(k+1));
    if p==0
        p=1;
    end
    g=norm(x);
    s=sqrt(2*g*(g+p*(x(k+1))));
    
    if s~=0
        w=x/s;
        w(k+1)=(x(k+1)+p*g)/s;
        C=w*w';
        d=(w'*A)*w;
        B=A-2*C*A-2*A*C+4*d*C;
    end
    A=B;
end