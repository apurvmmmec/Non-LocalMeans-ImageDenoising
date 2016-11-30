function [offsetsRows, offsetsCols, distances] = templateMatchingNaive(img,row, col,...
    patchSize, searchWindowSize)
% This function should for each possible offset in the search window
% centred at the current row and col, save a value for the offsets and
% patch distances, e.g. for the offset (-1,-1)
% offsetsRows(1) = -1;
% offsetsCols(1) = -1;
% distances(1) = 0.125;

% The distance is simply the SSD over patches of size patchSize between the
% 'template' patch centred at row and col and a patch shifted by the
% current offset

%REPLACE THIS
img(10,10)
offset =
offsetsRows = zeros(10,1);
offsetsCols = zeros(10,1);
distances = randn(10, 1);
end