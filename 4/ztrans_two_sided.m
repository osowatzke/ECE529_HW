function X = ztrans_two_sided(x)
    syms n z;
    sympref('HeavisideAtOrigin', 1);
    x_right = x*heaviside(n);
    x_left = x*heaviside(-n-1);
    X_right = simplify(ztrans(x_right));
    x_left_mod = subs(x_left,n,-n);
    X_left_mod = simplify(ztrans(x_left_mod));
    X_left = subs(X_left_mod,z,z^(-1));
    X = simplifyFraction(X_right + X_left);
end