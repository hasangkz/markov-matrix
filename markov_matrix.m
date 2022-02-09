n = randi([6 10]);
A = zeros(n, n);
S = [];
c = 0;
%A matrisi
for i = 1:n
    for j = 1:n
        A(j, i) = rand(1)*(0.2);
    end
end

A2 = A;

% Markov matrisi
for i = 1:n
    s = sum(A(:,i));
    S = [S s];
    d = 1 - s;
    if d > 0
        A2(1,i) = A2(1,i) + d;
        c = c + 1;
    elseif d < 0
        Col = [A2(:,i)];
        while d ~= 0
        [y,x] = max(Col(:));
              if Col(x) + d >= 0
                 A2(x,i) = A2(x,i) + d;
                 c = c + 1;
                 d = 0;
               elseif Col(x) + d < 0
                     A2(x,i) = 0;
                     c = c + 1;
                     d = d + Col(x);
                     Col = Col(Col ~= Col(x));
              end
        end
    end
end

fprintf("A matrisi: \n")
disp(A)

fprintf("Markov matrisi: \n")
disp(A2)

fprintf("Değişen eleman sayısı:")
disp(c)

S1 = [];
for i = 1:n
    s1 = sum(A2(:,i));
    S1 = [S1 s1];
end

fprintf("Markov matrisinin her bir sütununun toplamı: \n")
disp(S1)
