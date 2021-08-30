clear
close all

rng(96) % seed

n_nodes = 5;
degree = 3;
nodes = randperm(10,n_nodes);

b_bases(nodes,degree,true);