% Custom validation functions
function mustBeUnique(arg)
%MUSTBEUNIQUE all vector elements must be unique
    if length(arg) ~= length(unique(arg))
        error('Found duplicate nodes, nodes must be unique');
    end
end

