function [Q,R] = QR_factorization(A)
%QR_FACTORIZATION
%   es: [Q,R] = QR_factorization([1,2,3; 4,5,6])

[m,n] = size(A);

R = A;
Qt = eye(m);
i = 1;
M = n;
if m<=n
    M = m-1;
end
for i=1:M % handle both m<n and m>n
    x = R(i:m,i);
    % if a subvector is zeros skip it
    if x==zeros(length(x),1)
        continue;
    end
    % warning: do not use sign() directly because it's incorrect if x1==0
    sign_x = sign(x(1));
    sign_x(sign_x==0)=1;

    u = x + sign_x*norm(x)*eye(length(x),1);
    H_ = hauseholder_matrix(u);
    H = eye(m); H(i:m,i:m) = H_;
    R = round(H*R,6); % round to 0 if less than E-6 (error propagation)
    Qt = H*Qt;
end

Q = Qt';

end
