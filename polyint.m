% Inputs:
% x: a vector containing the x-values of the data points used
% y: a vector containing the y-values of the data points used.
% w: a vector of independent value(s) at which the polynomial is
%       to be evaluated

% Outputs:
% p: a vector containing the evaluation(s) of the polynomial at the
%       point(s) from the previously defined w vector.

% The following is an example of how this function might be called
% >> p = polyint([3 17 29], [35 92 87], [42 31])

function p = polyint(x, y, w)

% preallocate the vector of p to the size of w
p = zeros(1, length(w)); 
fprintf('p has been allocated to size %d\n', length(w));

% get the polynomial degree
n = length(x) - 1;
fprintf('the interpolated polynomial has degree %d\n', n); % print n

% initialize the sum to 0
sum = 0;

% loops according to # of values in w
for k = 1 : length(w)
    % start the sigma notation loop
    for i = 1 : n + 1
        product = 1; % initialize the product value at each new i to 1
        % begin the pi notation loop
        for j = 1 : n + 1
            if j ~= i % j should not be equal to i in order to get the product
                % lagrange product
                product = product * (w(k) - x(j)) / (x(i) - x(j));
            end % end if
        end % end j loop
        % compute sum in the i loop and add to itself
        sum = sum + y(i) * product;
    end % end i loop
    p(k) = sum; % place the value for the sum into the output vector
    sum = 0; % reset sum
end % end w loop
