%% AutoLinkCluster UP
%
clear 
clc
close all
%%
% load moore.mat
% data=moore(:,[2,4]);
% inputData=cat(2,data,linspace(1,1,20)');
%%
% inputData=xlsread(filename,sheet,xlRange);
%%
inputData=textread('FuzzyX.txt');
inputData=inputData(:,1:2);
% inputData=cat(2,inputData,ones(length(inputData),1));
%%

clustering_framework(inputData,[1,4,1.8],1)











