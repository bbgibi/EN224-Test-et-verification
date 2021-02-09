rng(0,'twister');
A = randi([0 65535],65536,1);
B = randi([0 65535],65536,1);
[Amin, Amax] = bounds(A)
[Bmin, Bmax] = bounds(B)

C = gcd(A,B);
fileA = fopen('ref_A.txt','w');
fprintf(fileA,'%d\n',A);
fclose(fileA);

fileB = fopen('ref_B.txt','w');
fprintf(fileB,'%d\n',B);
fclose(fileB);

fileC = fopen('ref_C.txt','w');
fprintf(fileC,'%d\n',C);
fclose(fileC);