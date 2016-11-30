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
%Eg  swSize=11, swR=5 so for patch centred at (row,col) patch range is
%(row-swR:row+swR,col-swR:col+swR)
swSize=searchWindowSize;
swR = (swSize-1)/2;
paddedImg = padarray(img,[swR swR],0,'both');
pR = (patchSize-1)/2;
index=0;
offsetsRows = zeros(swSize^2-1,1);
offsetsCols = zeros(swSize^2-1,1);
distances =   zeros(swSize^2-1,1);

patch = paddedImg(row+swR-pR:row+swR+pR,col+swR-pR:col+swR+pR);
tic
for offY=-swR:swR
    for offX = -swR:swR
        if(offX ==0 && offY ==0)
            %% Dont calculate SSD for this case
        else
            index=index+1;
            offsetsRows(index)=offY;
            offsetsCols(index)=offX;
            offPatch = paddedImg(row+offY+swR-pR:row+offY+swR+pR,col+offX+swR-pR:col+offX+swR+pR);
            distances(index) = sum(sum((patch-offPatch).^2));
        end
    end
end
toc
end