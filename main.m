% Main
clear;
clc;


n=15; %Number of Vertivces in Randomly Generated Graph
      %Do not use more than 20 if you want to run bruteforce as well
      %Also for large inputs create graph takes a while
      
epsilon = 0.000001; %Duality Gap for Stopping Criterion

display('=============================')
display('Input Size');
disp(n);
display('=============================')
%------------------------------------------------
%Starts to creat a graph
W = CreateGraph(n, 1, 5);
display('Graph Created!')
display('=============================')
%------------------------------------------------
%Runs Dual Scaling Algorithm
A = mtimes(W, ones(n,1));
Laplacian  = (1/4) * (diag(A) - W); 
[S, y, sum_y, progress] = ScalingAlg( -Laplacian, epsilon);
display('Scaling Optimum:')
disp(sum_y);
display('=============================')
%------------------------------------------------
%Runs BruteForce if Requested
request = 'Enter 1 if you also want to run bruteforce\nEnter 0 otherwise (Just Dual Scaling): ';
brute = input(request);
if (brute == 1)
  [ maxCut, maxList ] = BruteForceMaxCut( W );
  display('Bruteforce Optimum:')
  disp(maxCut);
end
display('=============================')
%------------------------------------------------
% This part creates a plot for internal progress of
% dual scaling algorithm per iteration
figure
plot(progress(1,:), progress(2, :),'--gs','LineWidth', 2);
xlabel('Iteration'), ylabel('Value')
set(gca, 'XTick',progress(1,:))
display('Figure Created')
display('=============================')