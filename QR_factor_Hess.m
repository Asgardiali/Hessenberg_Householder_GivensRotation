function [Q,R]=QR_factor_Hess(A)
[n,nn]=size(A);
Q=eye(n);
R=A;
for k=1:n-1
    x1=R(k,k);
    x2=R(k+1,k);
    c=x1/sqrt(x1^2+x2^2);
    s=-x2/sqrt(x1^2+x2^2);
    R_new=R;
    Q_new=Q;
    R_new(k,:)   = c*R(k,:)-s*R(k+1,:);
    R_new(k+1,:) = s*R(k,:)+c*R(k+1,:);
    Q_new(:,k)   = c*Q(:,k)-s*Q(:,k+1);
    Q_new(:,k+1) = s*Q(:,k)+c*Q(:,k+1);
    R=R_new;
    Q=Q_new;
end