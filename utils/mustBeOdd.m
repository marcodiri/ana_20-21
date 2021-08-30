% Custom validation functions
function mustBeOdd(arg)
%MUSTBEODD all vector elements must be unique
    r = mod(arg,2);
    if r ~= 1
        error('Value must be an odd number');
    end
end

