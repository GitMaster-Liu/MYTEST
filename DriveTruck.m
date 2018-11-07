function Track=DriveTruck(Initial_x,Initial_y,Initial_Pha,Theta_Mat,b)

Track=[];
x_t=Initial_x;
y_t=Initial_y;
Pha_t=Initial_Pha;
T=max(size(Theta_Mat));
for i=1:T  
    [x_tPlus1,y_tPlus1,Pha_tPlus1]=TruckModel(x_t,y_t,Pha_t,Theta_Mat(i),b);
    Track=[Track;x_tPlus1,y_tPlus1,Pha_tPlus1];
    x_t=x_tPlus1;
    y_t=y_tPlus1;
    Pha_t=Pha_tPlus1;   
end
return
    