function [Q,R]=QR_factor(A)
[n,nn]=size(A);
R=A;
Q=eye(n);

for k=1:n-1
    x=zeros(n,1);
    x(k:n,1)=R(k:n,k);
    g=norm(x);
    v=x;
    v(k)=x(k)+g;
    s=norm(v);
    if s~=0
        w=v/s;
        u=2*R'*w;
        R=R-w*u';
        Q=Q-2*Q*w*w';
        Q,R
    end
end