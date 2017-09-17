clc
clear all

%Data set : svmguide1 -YellowFin
%{
Filename = 'Cod-rna0';

%% Set
Set.Minibatch = 100;   %BatchSize
Set.Epoch     = 5;   %Epoch
Set.Overlap   = 1 ;   %Overlap

%% Trade-Off
%C = 5;
TF.C  = 0.001;
TF.C1 = 1;       %TrainLoss
TF.C2 = 0;      % Oversampling
TF.C2_1 =1;  %>0
TF.C2_2 =0.05;  %<0
TF.C3 = 0;      %Prox

%% Opt
 Opt.yf.beta  = 0.01;
 Opt.yf.width = 30;
 Opt.yf.l_r = 1;
 gamma = 65;


%Reduce kernel subset size
RatiofRS = 0.06;

profile on
[Result,Model] = Train_YellowFin(Filename,TF,Opt,Set,RatiofRS,gamma);
profile viewer
Result.train
Result.train2
Result.test
hold on
figure(1)
plot(reshape(Result.train.eta,1,size(Result.train.eta,1)*size(Result.train.eta,2)))
Kernelprint(Model.RS,Model.RS,gamma);
hold off
%}



%Data set : svmguide1 -YellowFin
%
Filename = 'Cod-rna0';

%% Set
Set.Minibatch = 100;   %BatchSize
Set.Epoch     = 1;   %Epoch
Set.Overlap   = 1 ;   %Overlap

%% Trade-Off
%C = 5;
TF.C  = 0.01;
TF.C1 = 1;       %TrainLoss
TF.C2 = 0;      % Oversampling
TF.C2_1 =1;  %>0
TF.C2_2 =0.9;  %<0
TF.C3 = 0;      %Prox

%% Opt
Opt.N = 0;
Opt.eta =0.0001;
Opt.beta=0.00003;
 gamma = 6;


%Reduce kernel subset size
RatiofRS = 0.05;

profile on
[Result,Model] = Train_SGD(Filename,TF,Opt,Set,RatiofRS,gamma);
profile viewer
Result.train
Result.train2
Result.test
hold on
figure(1)
plot(reshape(Result.train.eta,1,size(Result.train.eta,1)*size(Result.train.eta,2)))
Kernelprint(Model.RS,Model.RS,gamma);
%}