clc        %Use to clear the screen 
clear all  %Delete all the variable created in the workspace

while 1  % using loop so can run the program more than once-depends upon the user

fprintf('Sheheryar Ramzan     Roll No: 20I-0441\n');   % fprintf function used to print the group name in output window
fprintf('Fahad Ramzan         Roll No: 20I-0443\n');   % fprintf function used to print the group name in output window
fprintf('Rumaisa Ilyas        Roll No: 20I-0664\n');   % fprintf function used to print the group name in output window

fprintf('Press Enter or any other key To Continue.'); % fprintf function used to display the data in output window
pause;  % pause the screen or ouput untill user presses any key 

syms x; % used to declare x variable as a symbol 

% "cb_l" is the variable taken for cardboard length  
cb_l=input('\nPlease Enter length of the cardboard = '); % getting length of the cardboard from the user and
                                                       % assigning the value to the the variable "cb_l" 
% "cb_w" is the variable taken for cardboard width                                                       
cb_w=input('Please Enter width of the cardboard = ');  % getting width of the cardboard from the user and
                                                       % assigning the value to the the variable "cb_w" 
                                                       
if cb_l < cb_w 
    fprintf('Breadth you entered is greater than the length entered. \n'); 
    
    % dispalying the promt and taking input for the run varaible 
    run = input('Do you want to run the program again? Press 1 for yes and 0 for no = ');

     if run==0   % if user enter 0 for run varaible then the program stops
         break   % break statement terminates the loop
     end
     %      else
%          continue
%      end         % End is used to terminate if statement here.
end 

                                                       
v = (cb_l - (2.*x)).*(cb_w - x).*(x); % wrting equation for volume 

dv = diff(v);                         % differentiating volume equation

xs = solve(dv==0,x);                  % setting derivative of volume equation = 0 to get two values of x which 
                                      % will be stored in "xs"
                                      
x_s = ['Value of x for which dv/dx = 0 are  = ', num2str(double(xs(1))),' and ', num2str(double(xs(2)))];
disp(x_s) 
                                     

if (xs(1) > 0 && xs(1) < (cb_w/2))    % to satisfy the if-condition "xs" should be equal or smaller than the half of  
                                      % the cardboard width i.e. cb_w. So the domain of "v" is the interval 
                                      % 0 <= xs <= (cb_w)/2

    xv = xs(1);                       % if the above if-condition is satisfied then the value stored first in the array 
                                      % will be assigned to the variable "xv" and 2nd x value is ignored.  
else
    xv = xs(2);                       % if the above if-condition is not satisfied then the value stored second in the array 
                                      % will be assigned to the variable "xv" and 1st x value is ignored. 
end 

x_v = ['Value of x which is in the domain  = ', num2str(double(xv))];
disp(x_v) 


L = cb_l - (2.*xv);                   % "L" length is being calculated by using the final x value stored in "xv"
W = cb_w - xv;                        % "W" width is being calculated by using the final x value stored in "xv"
H = xv;                               % "H" height equal to value stored in "xv" 


o_l = ['Optimised length = ', num2str(double(L))];
disp(o_l)

o_w = ['Optimised width = ', num2str(double(W))];
disp(o_w)

o_h = ['Optimised Height = ', num2str(double(H))];
disp(o_h)

% x, y, z coordinates of all 8 points of the cardboard box
p1 = [0 0 0];
p2 = [L 0 0];
p3 = [L W 0]; 
p4 = [0 W 0];
p5 = [0 0 H];
p6 = [L 0 H];
p7 = [L W H];
p8 = [0 W H];

[x,y,z]=rec_plot(p1,p2,p3,p4);        % calling the function "rec_plot" to fill the base of the cardboard
fill3(x, y, z, 1);                    % fill3 function fills the x,y,z axis and assign the colour corresponding to 1
hold on                               % hold on retains the current plot and certain axes properties

[x,y,z]=rec_plot(p1,p4,p8,p5);        % calling the function "rec_plot" to fill the left side of the cardboard
fill3(x, y, z, 3);                    % fill3 function fills the x,y,z axis and assign the colour corresponding to 3


[x,y,z]=rec_plot(p4,p3,p7,p8);        % calling the function "rec_plot" to fill the back side of the cardboard   
fill3(x, y, z, 5);                    % fill3 function fills the x,y,z axis and assign the colour corresponding to 5
 

[x,y,z]=rec_plot(p2,p6,p7,p3);        % calling the function "rec_plot" to fill the right side of the cardboard 
fill3(x, y, z, 7);                    % fill3 function fills the x,y,z axis and assign the colour corresponding to 7
 

xlabel('L'); ylabel('W'); zlabel('H');% xlabel is x axis labeled with "L", ylabel is y axis labeled with "W",
                                      % zlabel is z axis labeled with "H"
                                        
grid                                  % function that forms a grid
hold off                              % hold off resets axes properties to their defaults before drawing new plots.


v = L*H*W;
X = ['Optimized volume of the cardboard box is = ', num2str(double(v))];
disp(X)

% dispalying the promt and taking input for the run varaible 
run=input('Do you want to run the program again? Press 1 for yes and 0 for no = ');

if run==0   % if user enter 0 for run varaible then the program stops
     break   % break statement terminates the loop
 end         % End is used to terminate if statement here. 
 %break
end         % End is used to terminate while loop here.
