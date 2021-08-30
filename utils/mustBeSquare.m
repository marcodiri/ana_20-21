% Custom validation functions
function mustBeSquare(arg)
%MUSTBESQUARE matrix must be square
    % all nodes must be unique
    if size(arg,1) ~= size(arg,2)
        error('Matrix must be square');
    end
end