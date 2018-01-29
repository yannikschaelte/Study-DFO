function [A,l,u] = ga_hard_Omega(x);
%
%min -9x_5-15*x_8+6x_1+16x_2+10(x_6+x_7) 
%s.t.
%x_1+x_2-x_3-x_4 = 0,
%0.03x_1+0.01x_2-x_9(x_3+x_4) = 0,
%x_3+x_6-x_5 = 0,
%x_4+x_7-x_8 = 0,
%x_9x_3+0.02x_6-0.025x_5 <= 0,
%x_9x_4+0.02x_7-0.015x_8 <= 0, 
%(0,0,0,0,0,0,0,0,0.01) <= x =< (300,300,100,200,100,300,100,200,0.03) 
%
n = length(x);
l = [  0;   0;   0;   0;   0;   0;   0;   0; 0.01; 0; 0; 0];
u = [300; 300; 100; 200; 100; 300; 100; 200; 0.03; 0; 0; 0];
A = [eye(n); 1 1 -1 -1 0 0 0 0; 0 0 1 0 -1 1 0 0; 0 0 0 1 0 0 1 -1];
return
end