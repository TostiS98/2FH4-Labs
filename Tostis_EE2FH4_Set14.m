clear
clc

% voltage on the outer and inner conductors
VOut=0;
V=100.0;

% number of points in the x and y direction, as well as the unknowns 
NumberOfXPoints=50; 
NumberOfYPoints=NumberOfXPoints; 
NumberOfUnKnowns=NumberOfXPoints*NumberOfYPoints; 

% matrix of coeffeicents, right, left, bottom vectors
A=zeros(NumberOfUnKnowns, NumberOfUnKnowns);
b=zeros(NumberOfUnKnowns,1);
i_line=(NumberOfXPoints)/2;
j_line=(NumberOfYPoints)/2;

% equation counter
EquationCounter=1;

% for all rows
for i=1:NumberOfXPoints

    % for all columns
    for j=1:NumberOfYPoints 
        if(i==i_line && j>=j_line)%V=100 for the line in middle of the top row up to half of that column
            A(EquationCounter, EquationCounter)=1;
            b(EquationCounter,1)=V;  
        elseif(i<i_line) && (j==NumberOfYPoints)%V=50 for the points less then that line
            A(EquationCounter, EquationCounter)=1;
            b(EquationCounter,1)=50; 
            
        elseif(i>i_line) && (j==NumberOfYPoints)%V=50 for the points greater then that line
            A(EquationCounter, EquationCounter)=1;
            b(EquationCounter,1)=50; 
            
        else
            A(EquationCounter, EquationCounter)=-4;
            if(j==1) %this is the first row
                b(EquationCounter)=b(EquationCounter)-VOut; 
            else%store the coefficient of bottom boundary
                A(EquationCounter,EquationCounter-1)=1.0;
            end
            if(j==NumberOfYPoints) % this is the last row
                b(EquationCounter,1)= b(EquationCounter,1)-50;%making 
            else %store coefficient of top boundary
                A(EquationCounter, EquationCounter+1)=1.0;
            end
            if(i==1) % this is the first column
                b(EquationCounter,1)=b(EquationCounter,1)-VOut;
            else %store coefficient of left point
                A(EquationCounter, EquationCounter-NumberOfXPoints)=1;
            end
            if(i==NumberOfXPoints) % this is the last column
                b(EquationCounter,1)=b(EquationCounter,1)-VOut;
            else%store coefficient of right point
                A(EquationCounter, EquationCounter+NumberOfXPoints)=1.0;
            end
        end
        EquationCounter=EquationCounter+1;
    end
end
V=A\b; %obtain the vector of voltages
V_Square=reshape(V, NumberOfXPoints, NumberOfYPoints);%convert values into a rectangular matrix
ax1 = nexttile;
surf(V_Square); %obtain the surface figure
colormap(ax1,spring);
figure;
[C,h] = contour(V_Square);% obtain the contour figure
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
colormap winter;
figure;
contour(V_Square);
[px,py] = gradient(V_Square);
hold on, quiver(-px,-py), hold off %obtain the electric field map by using E=-Gradient(V)