rng('default');
%% wczytanie plików
load ('baza2.mat');
load ('targety2.mat');

inputs = inputy';
targets = targety';

%% parametry sieci neuronowej
net = patternnet(39);

net.inputs{1}.processFcns = {'mapminmax'};
net.outputs{2}.processFcns = {'mapminmax'};

net.divideParam.trainRatio = 90/100;
net.divideParam.testRatio = 20/100;

net.trainFcn = 'trainscg';

net.trainParam.epochs = 1000;
net.trainParam.show = 25;
net.trainParam.goal = 0;
net.trainParam.min_grad = 1e-18;
net.trainParam.max_fail = 100;

net.performFcn = 'mse';

%% trenowanie sieci
[net,tr] = train(net,inputs,targets);

%% zapis danych
save net net;

disp('   Trenowanie neuronów zakonczone')
