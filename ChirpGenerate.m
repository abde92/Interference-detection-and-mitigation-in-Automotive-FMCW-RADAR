function [yvalue, phiEnd] = ChirpGen2(f0,f1,t,phi)
% ChirpGen2 function to compute beta and y for both
% linear and quadratic modes.
% p is the polynomial order (1 for linear and 2 for quadratic)
t1 = t(end);
beta   = (f1-f0).*(t1.^(-1));
yvalue = cos(2*pi*(beta./(2)*(t.^(2))+f0*t+phi/360));
phiEnd = mod(360*(beta(end)/(2)*(t(end)^(2))+f0*t(end)+phi/360),360);
end


