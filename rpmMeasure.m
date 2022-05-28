% Constants
C = [486 ;638];
fps = 500;
n=24;
p=2;
slno = [1:(n-2)];
% Initializing x-coordinate vector, y-coordinate vector, theta vector and omega vector
x = [447;377;313;268;238;223;233;256;303;363;430;504;576;644;697;734;753;751;730;689;632;566;490;418];
y = [375;396;437;492;558;627;701;769;829;868;896;902;888;855;802;742;668;593;521;463;412;383;373;381];
theta=zeros((n-1),1);
omega= zeros((n-2),1);
% Computation of theta vector 
for i =1:(n-1)
    theta(i)=(180/pi)*(atan((y(i)-C(2))/(x(i)-C(1))));
    % disp(['The value of angle in degrees is : ', num2str(theta(i))])
end

%% Computation of omega vector

for i = 1:(n-2)
    if (theta(i) > theta(i+1))
        omega(i)=abs((60/(2*pi))*(((pi/180)*(theta(i+1)-theta(i)))/(1/fps)));
    else 
        omega(i)=p*(abs((60/(2*pi))*(((pi/180)*(theta(i+1)+theta(i)))/(1/fps))));
    end

    % disp(['The value of speed in rpm is : ',num2str(omega(i))]);
end
% Plot of omega vs slno and theta vs slno
plot(slno,omega,'--r');
xlabel('slno');
ylabel('Speed in rpm, Theta in degrees');
title('Graphs for speed and angle');
hold on
slno=[1:(n-1)];
plot(slno,theta,'-b');
legend('Speed','Angle');
shg
% Display results
%disp(theta)
%disp(omega)
% Calculation of average speed
avgSpeed = sum(omega)/(n-2);

