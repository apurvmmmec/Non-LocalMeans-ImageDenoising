function [offsetsRows, offsetsCols, distances] = templateMatchingIntegralImage(img,row,...
    col,patchSize, searchWindowSize)
% This function should for each possible offset in the search window
% centred at the current row and col, save a value for the offsets and
% patch distances, e.g. for the offset (-1,-1)
% offsetsX(1) = -1;
% offsetsY(1) = -1;
% distances(1) = 0.125;

% The distance is simply the SSD over patches of size patchSize between the
% 'template' patch centred at row and col and a patch shifted by the
% current offset

% This time, use the integral image method!
% NOTE: Use the 'computeIntegralImage' function developed earlier to
% calculate your integral images
% NOTE: Use the 'evaluateIntegralImage' function to calculate patch sums

%REPLACE THIS
swSize=searchWindowSize;
swR = (swSize-1)/2;
paddedImg = padarray(img,[swR swR],0,'both');
pWR = (patchSize-1)/2;
index=0;
offsetsRows = zeros(swSize^2-1,1);
offsetsCols = zeros(swSize^2-1,1);
distances =   zeros(swSize^2-1,1);
i=1:size(img,1);
j=1:size(img,2);

tic
for offY=-swR:swR
    for offX = -swR:swR
        if(offX ==0 && offY ==0)
            %% Dont calculate SSD for this case
        else
            index=index+1;
            offsetsRows(index)=offY;
            offsetsCols(index)=offX; 
            offImg(i,j) = paddedImg(i+swR+offY,j+swR+offX);
            imSq= (img-offImg).^2;
            intImg=cumsum(cumsum(imSq),2);
            padInt = padarray(intImg,[1 1],0);
            I1=padInt(col+1-pWR-1,row+1-pWR-1);
            I2=padInt(col+1+pWR,row+1-pWR-1);
            I3=padInt(col+1-pWR-1,row+1+pWR);
            I4=padInt(col+1+pWR,row+1+pWR);
            
            distances(index) = I4-I2-I3+I1;
        end
    end
end
toc
end