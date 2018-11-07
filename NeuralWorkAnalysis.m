clear
clc

load('neuralControlData.mat');
net10_5=feedforwardnet([10,5]);
net10_5 = train(net10_5,TrainData_phi_x_theta(:,1:2)',TrainData_phi_x_theta(:,3)');

test_num = 5;
xT = TrainData_phi_x_theta(1:test_num,1:2)';
yt = TrainData_phi_x_theta(1:test_num,3)'
yo = sim(net10_5,xT)

[X1 psx] = mapminmax(TrainData_phi_x_theta(:,1:2)');  
[t1 pst] = mapminmax(TrainData_phi_x_theta(:,3)');
xT1 = mapminmax('apply',xT,psx);

net1 = net10_5.IW{1}*X1+net10_5.b{1};
o1 = tansig(net1);
net2=net10_5.LW{2,1}*o1+net10_5.b{2};
o2 = tansig(net2);
net3=net10_5.LW{3,2}*o2+net10_5.b{3};

yo3 = net3;
yo3_1 = mapminmax('reverse',yo3,pst);

yo3_1(1:test_num)

%输出结果与yt yo 一致！