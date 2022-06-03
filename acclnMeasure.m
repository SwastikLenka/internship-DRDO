%% Constants
lengt = 4.6e-2;
pixDiff = 149;
sFactor = lengt/pixDiff;
n = 35;
frameDiff = 7;
fps = 1000;
t = [0:frameDiff/fps:((n-3)*frameDiff)/fps];
trueVal = 9.81;

%% Initializing x-coordinate vector, y-coordinate vector, velocity vector and acceleration vector
xVec = [604;604;604;604;604;602;600;598;598;596;596;594;592;592;590;590;
    588;588;584;584;582;578;576;574;574;570;570;568;566;564;560;558;558;554;552];
yVec = [166.778;169.1113;173;178.45;185.45;194.005;204.1151;215.7809;229.002;243.779;260.1106;278;
    297.442;318.4399;341;365.1028;390.7674;417.9874;446.7629;477.0938;508.9801;542.4221;577.4193;
    613.9719;652.0799;691.744;732.9624;775.7367;820.0665;865.97;913.4098;962.4046;1012.9544;1065.0592;1118.719];
displ = zeros(n-1,1);
displm = zeros(n-1,1);
vel = zeros((n-1),1);
accln = zeros((n-2),1);
displacement1 = zeros((n-2),1);

%% Computation of velocity vector
for i =1:(n-1)
    displ(i) = sqrt((xVec(i+1) - xVec(i))^2 + (yVec(i+1) - yVec(i))^2);
    displm(i) = sFactor*displ(i);
    vel(i) = sFactor*(displ(i)/(frameDiff*(1/fps)));
    % disp(['The value of velocity in m/s is : ', num2str(vel(i))]);
end

%% Computation of acceleration vector
for i = 1:(n-2)
    accln(i) = (vel(i+1) - vel(i))/(frameDiff*(1/fps));
    % disp(['The value of acceleration in m/s^2 is : ', num2str(accln(i))]);
end

%% Calculation of displacement vector
for i = 1:(n-2)
    displacement1(i) = 0.5*accln(i)*t(i)^2;
end

%% Plot of displacement vs time, velocity vs time, acceleration vs time
plot(t,displacement1,'--r');
xlabel('time in s');
ylabel('Displacement in m');
title('Graph for displacement vs time');
hold on
t = [0:frameDiff/fps:((n-2)*frameDiff)/fps];
plot(t,vel,'-b');
xlabel('time in s');
ylabel('Velocity in m/s');
title('Graph for velocity vs time');
hold on
t = [0:frameDiff/fps:((n-3)*frameDiff)/fps];
plot(t,accln,'g');
xlabel('time in s');
ylabel('Acceleration in m/s^2');
title('Graph for acceleration vs time');
shg

%% Calculation of average acceleration
avgAccln = sum(accln)/(n-2);

%% Calculation of error
err = abs(accln-trueVal);

%% Calculation of mean & standard deviation of error
meanErr = sum(err)/(n-2);
VarianceErr = ((sum((err).^2))/(n-2)) -meanErr^2  ;
stndDevitnErr = sqrt(VarianceErr);

%% Display results

% disp(displacement1)
% disp(vel)
% disp(accln)
disp(meanErr);
disp(stndDevitnErr);



