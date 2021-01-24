function [mlmax_F,mlmax_B,r,m_new] = WEN(m,L)
% WEN: Weighted Envolope Normalization
% m: Beat frequency signal vector
K_m=length(m); %number of sample in 1 snapshot
m_l=zeros(L,1);%% mod vector for storing
mlmax_F = zeros(K_m,1); 
mlmax_B = zeros(K_m,1);
r=zeros(K_m,1);
w=zeros(K_m,1);
m_new=zeros(K_m,1);
for k=1:K_m
   l=k:k+L-1; %% Forward sliding window
   i=mod(l,K_m)+1; %% Modulo of the vector l, by the K_m >> forward sliding
   m_l=m(i); %% extract i values from m (i is a vector of indexs)
   m_l_max_F=max(abs(m_l)); %% find the max value in m_l vector
   mlmax_F(k)=m_l_max_F; %% assign the m_l-max to the k th index
   l=k-L+1:k;%% backward sliding window
   i=mod(l,K_m)+1; %% modulo >> backward sliding
   m_l=m(i);  %% 
   m_l_max_B=max(abs(m_l));%
   mlmax_B(k)=m_l_max_B; %%
r(k)=min(m_l_max_B,m_l_max_F); %%
r_k=r(k); %% 
w(k)=1/r(k);%% 
w_k=w(k); %% 
m_new(k)=w_k*m(k); %%
m_new_k=m_new(k); %%
end
mlmax_F(K_m)=m_l_max_F ; %% forward sliding window maxima
mlmax_B(K_m)=m_l_max_B ; %% backward sliding window maxima
r(K_m)=r_k; %%  find the envelope of the mixer
w(K_m)=w_k; %% 
m_new(K_m)=m_new_k; %% Normalize the mixer output m with the weighted gain 
end

