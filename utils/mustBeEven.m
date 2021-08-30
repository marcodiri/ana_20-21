% Custom validation functions
function mustBeEven(arg)
%MUSTBEEVEN
    if mod(arg,2) ~= 0
        error('Value must be an even number');
    end
end

