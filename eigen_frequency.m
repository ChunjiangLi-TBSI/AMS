function eigen = eigen_frequency(lambda, qx, qy, dq, g)
    mat = diag([qx+2*dq, qx+dq, qx, qx-dq, qx-2*dq].^2) + lambda*diag([qy, qy, qy, qy, qy].^2) + diag([g, g, g, g, g]);
    mat(1, 2) = -g/2;
    mat(2, 1) = -g/2;
    mat(2, 3) = -g/2;
    mat(3, 2) = -g/2;
    mat(3, 4) = -g/2;
    mat(4, 3) = -g/2;
    mat(4, 5) = -g/2;
    mat(5, 4) = -g/2;
    eigen = eig(mat);
end