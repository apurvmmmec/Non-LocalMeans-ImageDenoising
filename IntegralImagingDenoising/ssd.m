function [] = ssd()
imgO =imread('images\debug\treesReference.png');
img=im2double(rgb2gray(imgO));
A = [1 2 1 1 0 2 1 3 4 0 0 0;...
     2 3 1 1 0 0 1 1 1 0 2 3;...
     1 1 1 0 2 3 1 0 0 0 1 2;...
     1 3 4 0 0 0 1 3 4 0 0 0;...
     1 0 0 0 2 3 1 0 0 0 0 0;...
     1 2 4 2 0 0 1 3 4 0 0 0;...
     2 3 1 1 0 0 1 1 1 0 2 3;...
     1 1 1 0 2 3 1 0 0 0 1 2;...
     1 3 4 0 0 0 1 3 4 0 0 0;...
     2 3 1 1 0 0 1 1 1 0 2 3;...
     1 1 1 0 2 3 1 0 0 0 1 2;...
     1 3 4 0 0 0 1 3 4 0 0 0;...
     1 2 4 2 0 0 1 3 4 0 0 0;...
     2 3 1 1 0 0 1 1 1 0 2 3;...
     1 1 1 0 2 3 1 0 0 0 1 2;...
     1 3 4 0 0 0 1 3 4 0 0 0];...
     B=repmat(A,6,6);
     %% Let patchSize be 5x5, and window size be 11x11
     %% For pixel 8,8, patch is 6,6 to 10,10
     %% For offset -2,-3, offset patch is 4,3  to 8,7
     patch=A(6:10,6:10)
     offPatch=A(4:8,3:7)
     diff=sum(sum((patch-offPatch).^2))
     
     %% For pixel 3,3, patch is 1,1 to 5,5
     %% For offset -5,-5, offset patch is 4,3  to 8,7
     patch=A(1:5,1:5)
     offPatch=zeros(5,5)
     diff=sum(sum((patch-offPatch).^2))
     
     
     imshow(B);
    
search=B(5:15,5:15); 
a = [1 2 1;...
     2 3 1;...
     1 1 1];
b = [1 1 1 1;...
     1 0 0 4;...
     1 0 0 1;...
     1 0 1 1];
c= [0 1 2 1;1 0 1 2;0 0 1 0;1 0 1 1]
 
tic;
  
%%Calculate ssd of patch cenred at (2,2) with patch of offset (0,-1) i.e 
%% patch that is down in Y-direction by 1 and X by 0 pixels.

%%Calculate difference image for offset (0,-1)
% offCols = 5;
% offRows = 5;
swR=5;
offX=+5;
offY=+5;
paddedImg = padarray(A,[swR swR],0,'both');
i=1:size(A,1);
j=1:size(A,2);
offImg(i,j) = paddedImg(i+swR+offY,j+swR+offX)    
imSq= (A-offImg).^2;
intImg=cumsum(cumsum(imSq),2)
%%ssd for a patch centred at x,y and patchWindow size a,a is
padInt = padarray(intImg,[1 1],0)
pWR=2;
x=3;
y=3;
I1=padInt(x+1-pWR-1,y+1-pWR-1)
I2=padInt(x+1+pWR,y+1-pWR-1)
I3=padInt(x+1-pWR-1,y+1+pWR)
I4=padInt(x+1+pWR,y+1+pWR)
ssd=I4-I2-I3+I1
toc
 
 
%  
%  
%  i=1:size(b,1);
% j=1:size(b,2);
% if( ((i-offRows) <1))% |  |((j-offCols) <1) | ((j-offCols) > size(b,2)))
%     offImg(1:offRows,:)=0;
% elseif((i-offRows) > size(b,1))
%     offImg(size(b,1)+1:offRows,:)=0;
%     
% elseif( ((j-offCols) <1) )
%     offImg(:,1:offCols)=0;
% elseif( ((j-offCols) > size(b,2)))
%      offImg(:,size(b,2)+1:offCols)=0;
% end
    

end