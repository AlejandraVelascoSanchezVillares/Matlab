%% Pr�ctica 3A. Descomposici�n en valores singulares (SVD)
% Alejandra Velasco S�nchez-Villares (51460400-Q)
% 
% En la Pr�ctica 2 hemos aprendido a hacer la descomposici�n espectral de 
% una matriz sim�trica y definida positiva. En adelante, emplearemos el comando 
% |[V,D]=eigs(A)| de MATLAB, donde |V| es la matriz cuyas columnas son autovectores 
% y |D| es una matriz diagonal de autovalores ordenados decrecientemente en valor 
% absoluto.
% 
% 1. Escribir en el Ap�ndice A1 una funci�n que calcule la descomposici�n 
% SVD reducida de una matriz $\mathbf A \in \mathcal M_{n\times m}$, y que responda 
% a la sintaxis
% 
%     |[U,S,V]=svd_eigs(A)|
% 
% utilizando la descomposici�n espectral de $\mathbf A^t \mathbf A$ calculada 
% mediante el comando |eigs| de MATLAB.
% 
% 2. Probar la funci�n sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 0 \\ 2 & 1 \\0 & 1\end{array}\right)$$
% 
% comparar con la salida del SVD de MATLAB, dado por el comando |svd|


%% 
% *Soluci�n:* En la salida de MATLAB la matriz U tiene una columna m�s, 
% porque calcula una base completa del espacio de llegada, y no s�lo la base reducida 
% la reducida. La matriz S tiene una fila m�s llena de 0s, para que las matrices 
% se puedan multiplicar.
% 
% 3. Probar la funci�n sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 2 & 0 \\ 0 & 1 & 1\end{array}\right)$$


%% 
% 4. Probar la funci�n sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 2 & 0 \\ 0 & 1 & 1 \\ 0 & 0 & 
% 0\end{array}\right)$$
% 
% �Cu�les son las dimensiones de las matrices obtenidas? �Por qu�?


%% 
% La matriz U es 3 x 2, S es 2 x 2 y V es 3 x 2. Esto ocurre porque la matriz 
% no es de rango m�ximo y estamos calculando la factorizaci�n SVD reducida.
%% Ap�ndice A
% A1. Descomposici�n SVD

function [U,S,V] = svd_eigs(A)
    [n m] = size(A);
    [V, D] = eigs(A'*A);
    U = zeros(n,m);
    r = 1;
    epsilon = 0.0001;
    while D(min(r,m),D(min(r,m))) > epsilon && r<=m
        r = r+1;
    end
    for k = 1:r
        U(:,k)= A * V(:,k) / D(k,k);
    end
    V = 
end